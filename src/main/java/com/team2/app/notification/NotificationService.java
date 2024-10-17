package com.team2.app.notification;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.team2.app.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NotificationService {

	// 연결 지속시간 한시간
	private static final Long DEFAULT_TIMEOUT = 60L * 1000 * 60;

	// 로그인한 클라이언트의 SseEmitter 객체
	// key = emitterId = empNum+uuid, value = SseEmitter
	private Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();

	// 이벤트 발생 내역 저장
	// key = emitterId = empNum+uuid, value = 이벤트
	private Map<String, Object> eventCache = new ConcurrentHashMap<>();

	public SseEmitter subscribe(EmployeeVO employeeVO, String lastEventId) throws Exception {
		

		log.info("=============== 알림 Sse 연결");
		log.info("emitter 생성");
		// 시간제한있는 SseEmitter 객체 생성
		SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);

		log.info("SseEmitter: {}", employeeVO.getEmpNum());
		String emitterId = employeeVO.getEmpNum()+"";

		
		// 시간 초과나 비동기 요청이 안되면 자동으로 삭제
		emitter.onCompletion(() -> emitters.remove(emitterId));
		emitter.onTimeout(() -> emitters.remove(emitterId));
		

		// 각 emitterId와 emitter 객체 저장
		save(emitterId, emitter);
		
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setNotificationContent(employeeVO.getEmpId() + "SseEmitter 연결 성공");
		notificationVO.setNotificationType(NotificationType.CONNECT);
		
		// 최초 연결시 더미데이터가 없으면 503 오류가 발생하기 때문에 해당 더미 데이터 생성
		sendToClient(emitter, emitterId, notificationVO);

		log.info("emitters length : {}", emitters.size());
		log.info("emitterId : {}", emitterId);

		
		

		// lastEventId 있다는것은 연결 종료, 그래서 해당 데이터가 남아있는지 살펴보고 있다면 남은 데이터를 전송
		if (!lastEventId.isEmpty()) {
			log.info("lastEventId");
			Map<String, Object> events = findEventCache(employeeVO);

			events.entrySet().stream().filter(entry -> lastEventId.compareTo(entry.getKey()) < 0).forEach(entry -> {
				try {
					sendToClient(emitter, entry.getKey(), (NotificationVO) entry.getValue());
				} catch (Exception e) {
					e.printStackTrace();
				}
			});
		}

		return emitter;
	}

	public void send(NotificationVO notificationVO) throws Exception {

		Map<String, SseEmitter> sendEmitters = findEmitter(notificationVO.getEmployeeVO());
		sendEmitters.forEach((emitterId, emitter) -> {
			try {
				log.info("send emitterId: {}", emitterId);
				log.info("send emitter: {}", emitter);
				saveEventCache(emitterId, notificationVO);
				sendToClient(emitter, emitterId, notificationVO);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		});
	}



	private void sendToClient(SseEmitter emitter, String emitterId, NotificationVO notificationVO) throws Exception {
		try {
			emitter.send(SseEmitter
					.event()
					.id(emitterId)
					.name(notificationVO.getNotificationType().toString())
					.data(notificationVO.getNotificationContent()));
		} catch (IOException e) {
			delete(emitterId);
		}

	}

	public SseEmitter save(String emitterId, SseEmitter sseEmitter) throws Exception {
		emitters.put(emitterId, sseEmitter);
		return sseEmitter;
	}

	public void saveEventCache(String emitterId, Object event) throws Exception {
		eventCache.put(emitterId, event);
	}

	public Map<String, SseEmitter> findEmitter(EmployeeVO employeeVO) throws Exception {
		return emitters.entrySet().stream()
				.filter(entry -> entry.getKey().startsWith(employeeVO.getEmpNum().toString()))
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	public Map<String, Object> findEventCache(EmployeeVO employeeVO) throws Exception {
		return eventCache.entrySet().stream()
				.filter(entry -> entry.getKey().startsWith(employeeVO.getEmpNum().toString()))
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	public void delete(String emitterId) throws Exception {
		log.info("delete");
		emitters.remove(emitterId);
	}
}
