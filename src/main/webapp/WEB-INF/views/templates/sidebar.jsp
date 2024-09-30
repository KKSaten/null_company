<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Sidebar -->
                <div class="sidebar" data-background-color="bright">
                
                    <div class="sidebar-logo">
                    <!-- Logo Header -->
		<div class="logo-header" data-background-color="bright">

			  <div class="profile-container" style="display: flex; align-items: center;">
        <!-- 프로필 사진 -->
        <a href="/employee/mypage" class="logo" style="margin-right: 10px;">
            <img
                src="../../resources/img/profile.jpg" 
                alt="profile photo"
                class="navbar-brand"
                height="50"
                style="border-radius: 50%;"
            />
        </a>
        <!-- 이름 및 직급 정보 -->
        <div class="profile-info">
            <p class="name" style="margin: 0; font-weight: bold;">김해린</p>
            <p class="position" style="font-size: 14px; color: gray; margin: 0;">인사팀 - 대리</p>
        </div>
    </div>

   
                      
    <!-- 메뉴 토글 -->
    <div class="nav-toggle">
        
    </div>

    <!-- 상단바 토글 -->
    <button class="topbar-toggler more">
        <i class="gg-more-vertical-alt"></i>
    </button>
</div>
		<!-- End Logo Header -->
                    </div>
                    
                    <div class="sidebar-wrapper scrollbar scrollbar-inner">
                    <div class="sidebar-content">
                        <ul class="nav">
                        <li class="nav-item">
                         <!-- 출근 버튼 -->
                       <div class="d-grid gap-2 col-12 col-md-8 mx-auto">
  <button id="work_button" type="button" class="btn btn-black btn-border dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" >
                          출근하기
                        </button>
                       
                 <ul class="dropdown-menu col-12 col-md-8">
    <li><a id="alert_demo_8" type="button"  class="dropdown-item">출근하기</a></li>
    
      <c:if test="${isClockedIn}">
      <li>
        <a href="./commute/checkIn" id="checkout" type="button" class="dropdown-item">퇴근하기</a>
      </li>
    </c:if>
  </ul>
                        </div>
                        </li>
                        
                          <li class="nav-item">
                            <a data-bs-toggle="collapse" href="/">
                         <i class="fas fa-comments"></i>
                            <p>메신저</p>
                            </a>                           
                        </li>    
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="/">
                           <i class="fas fa-bell"></i>
                            <p>새로운 소식</p>                  
                            </a>
                           
                        </li>    
                        
                        <li class="nav-section">
                            <span class="sidebar-mini-icon">
                            <i class="fa fa-ellipsis-h"></i>
                            </span>
                            <h4 class="text-section"></h4>
                        </li>
                        
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="/notice/list">
                          <i class="fas fa-bullhorn"></i>
                            <p>공지사항</p>
                            
                            </a>
                           
                        </li>            
                         <li class="nav-item">
                            <a data-bs-toggle="collapse" href="/">
                          <i class="fas fa-users"></i>
                            <p>구성원</p>
                            </a> 
                        </li>            
                          <li class="nav-item">
                            <a data-bs-toggle="collapse" href="/">
                           <i class="far fa-calendar-alt"></i>
                            <p>캘린더</p>
                            </a>
                            </li>
                            
                         <li class="nav-item">
                            <a data-bs-toggle="collapse" href="/commute/list">
                            <i class="fas fa-history"></i>
                            <p>근태관리</p>
                            
                            </a></li>
                           <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#commute">
                      <i class="fas fa-exchange-alt"></i>
                            <p>인사 발령</p>
                            <span class="caret"></span>
                            </a>
                            <div class="collapse" id="commute">
	                            <ul class="nav nav-collapse">
	                                <li>
	                                <a href="/approval/approvalDocbox">
	                                    <span class="sub-item">결재 문서함</span>
	                                </a>
	                                </li>
	                                <li>
	                                <a href="/">
	                                    <span class="sub-item">추후 수정</span>
	                                </a>
	                                </li>                                
	                            </ul>
                            </div>
                        </li>                
                         <li class="nav-item">
                            <a data-bs-toggle="collapse" href="/vacation/list">
                           <i class="fas fa-plane"></i>
                            <p>휴가</p>
                            </a>        
                      		</li>
                      		
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#approvals">
                           <i class="fas fa-marker"></i>
                            <p>전자결재</p>
                            <span class="caret"></span>
                            </a>
                            <div class="collapse" id="approvals">
	                            <ul class="nav nav-collapse">
	                                <li>
	                                <a href="/approval/approvalDocbox">
	                                    <span class="sub-item">결재 문서함</span>
	                                </a>
	                                </li>
	                                <li>
	                                <a href="/">
	                                    <span class="sub-item">추후 수정</span>
	                                </a>
	                                </li>                                
	                            </ul>
                            </div>
                        </li>                       
                       
                        </ul>
                    </div>
                    </div>
                </div>
                <!-- End Sidebar -->

<script type="text/javascript">
const dd = document.getElementById("alert_demo_8");
const workButton = document.getElementById("work_button");

dd.addEventListener("click", function (e) {
  swal({
    title: "출근하시겠습니까?",
    text: "",
    icon: "warning",
    buttons: {
      cancel: {
        visible: true,
        text: "취소",
        className: "btn btn-danger",
      },
      confirm: {
        text: "승인",
        className: "btn btn-success",
      },
    },
  }).then((willDelete) => {
    if (willDelete) {
      // 현재 시간을 가져와서 버튼 텍스트 변경
      var now = new Date();
      var hours = now.getHours().toString().padStart(2, '0');
      var minutes = now.getMinutes().toString().padStart(2, '0');
      var currentTime = hours + ':' + minutes;

      workButton.textContent = "출근 시간: " + currentTime;
     

      swal("출근처리가 완료되었습니다!", {
        icon: "success",
        buttons: {
          confirm: {
            className: "btn btn-success",
          },
        },
      });
    } else {
      swal("출근처리를 실패하였습니다", {
        buttons: {
          confirm: {
            className: "btn btn-danger",
          },
        },
      });
    }
  });
});

checkout.addEventListener("click", function (e) {
  swal({
                    title: "퇴근하시겠습니까?",
                    text: "",
                    type: "warning",
                    buttons: {
                      cancel: {
                        visible: true,
                        text: "취소",
                        className: "btn btn-danger",
                      },
                      confirm: {
                        text: "승인",
                        className: "btn btn-success",
                      },
                    },
                  }).then((willDelete) => {
                    if (willDelete) {
                      swal("퇴근처리가 완료되었습니다!", {
                        icon: "success",
                        buttons: {
                          confirm: {
                            className: "btn btn-success",
                          },
                          
                        },
                      });
                    } else {
                      swal("퇴근처리를 실패하였습니다", {
                        buttons: {
                          confirm: {
                            className: "btn btn-danger",
                          },
                        },
                      });
                    }
                  });
                })
              
              
</script>