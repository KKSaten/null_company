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
	
	// key = emitterId = empNum+uuid, value = SseEmitter
	private Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();
	// key = emitterId = empNum+uuid, value = 이벤트
	private Map<String, Object> eventCache = new ConcurrentHashMap<>();

	public SseEmitter subscribe(EmployeeVO employeeVO, String lastEventId) throws Exception {
		
		// 고유한 아이디 생성
		String emitterId = employeeVO.getEmpNum() + "_" + System.currentTimeMillis();
		
		// 시간제한있는 SseEmitter 객체 생성
		SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);
		// 각 emitterId와 emitter 객체 저장
		save(emitterId, emitter);
		
		NotificationVO notificationVO = new NotificationVO();
		
		notificationVO.setEmitterId(emitterId);

		log.info("Notificaion Service ===============");
		log.info("emitterId : {}", emitterId);

		// 시간 초과나 비동기 요청이 안되면 자동으로 삭제
		emitter.onCompletion(() -> emitters.remove(emitterId));
		emitter.onTimeout(() -> emitters.remove(emitterId));
		
		emitters.forEach((key, value)->{
			try {
				sendToClient(value, key, "SSE 연결 성공");
			} catch (Exception e) {
				e.printStackTrace();
			}
		});

		// 최초 연결시 더미데이터가 없으면 503 오류가 발생하기 때문에 해당 더미 데이터 생성

		// lastEventId 있다는것은 연결이 종료됬다. 그래서 해당 데이터가 남아있는지 살펴보고 있다면 남은 데이터를 전송
		if (!lastEventId.isEmpty()) {
			Map<String, Object> events = findEventCache(notificationVO);
			events.entrySet().stream().filter(entry -> lastEventId.compareTo(entry.getKey()) < 0).forEach(entry -> {
				try {
					sendToClient(emitter, entry.getKey(), entry.getValue());
				} catch (Exception e) {
					e.printStackTrace();
				}
			});
		}

		return emitter;
	}

	public void send(NotificationVO notificationVO) throws Exception {

		emitters = findEmitter(notificationVO);
		emitters.forEach((emitterId, emitter) -> {
			try {
				saveEventCache(emitterId, notificationVO);
				sendToClient(emitter, emitterId, notificationVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}

	private void sendToClient(SseEmitter emitter, String emitterId, Object data) throws Exception {
		try {
			emitter.send(SseEmitter.event()
							.name("test")
							.data(data));
		} catch (Exception exception) {
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

	public Map<String, SseEmitter> findEmitter(NotificationVO notificationVO) throws Exception {
		return emitters.entrySet().stream()
				.filter(entry -> entry.getKey().startsWith(notificationVO.getEmitterId()))
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	public Map<String, Object> findEventCache(NotificationVO notificationVO) throws Exception {
		return eventCache.entrySet().stream()
				.filter(entry -> entry.getKey().startsWith(notificationVO.getEmitterId()))
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	public void delete(String emitterId) throws Exception {
		emitters.remove(emitterId);
	}
}
