<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <link
    rel="icon"
    href="../../resources/img/kaiadmin/favicon.ico"
    type="image/x-icon"
    />

    <!-- Fonts and icons -->
    <script src="../../resources/js/plugin/webfont/webfont.min.js"></script>
    <script>
        WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
            families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
            ],
            urls: ["../../resources/css/fonts.min.css"],
        },
        active: function () {
            sessionStorage.fonts = true;
        },
        });
    </script>
    
    <style>
      .no_dot {list-style-type: none }
    	.custom-list1 {width: 1000px !important}
    	.custom-list2 {font-size:40px !important}
    	.custom-list2 {margin-top: 60px !important}
    	.custom-list2 {margin-bottom: 60px !important}
    	.custom-list3 {font-size:20px !important}
    	.custom-list3 {font-weight: bold !important}
    	.custom-list4 {font-weight: bold !important}
    	.custom-list4 {color: gray !important}
    	.custom-post1 {font-size:25px !important}
    	.custom-post1 {font-weight: bold !important}
    	.custom-post2 {font-size:15px !important}
    	.custom-post2 {font-weight: bold !important}
    	.custom-post2 {margin-top: 50px}
    	.custom-post2 {margin-left: 30px}
    	.custom-post2 {height: 500px}
    	.custom-write1 {margin-top: 50px}
    	.custom-write2 {margin-left: 30px}
    	.custom-write3 {margin-left: 15px}
    	.custom-page1 {margin-right: 15px}
    	.custom-page2 {margin-left: 15px}
   		
   		/* 댓글과 답글 스타일 */
    	.custom-comment1 {margin-bottom: 20px; padding: 10px;}
    	.custom-comment2 {font-weight: bold; font-size: 12px; color: gray;}
    	.custom-comment3 {font-size: 13px; padding: 8px 10px; background-color: #f7f7f7; border-radius: 5px;}
    	.commentLine {border-top: 1px solid #ddd;}
    	.commentMod, .commentDel, .replyAdd {margin-left: 10px; font-size: 12px; color: #007bff; cursor: pointer;}
    	.modContents {width: 100%; min-height: 100px; margin-top: 10px;}
    	.btn-black {background-color: #333; color: #fff;}

    	/* 답글의 스타일 */
    	.replySection {padding-left: 60px; margin-top: 10px;}
    	.replyBox {border-left: 2px solid #ddd; padding-left: 15px;}
   		.replyDate {font-size: 12px; color: #666;}
   		.replyContents {background-color: #f1f1f1; border-radius: 5px; padding: 8px; margin-top: 5px;}
   		
   		/* 답글 입력 스타일 */
   		.addReplyContentsDiv {margin-left: 60px;}
   		
   		/* 캘린더 이벤트 글자 크기 */
   		.custom-event {font-size: 1.5em; padding: 10px;}
   		
    </style>

	<script src="../../resources/js/core/jquery-3.7.1.min.js"></script>
    <!-- CSS Files -->
    <link rel="stylesheet" href="../../resources/css/kaiadmin.min.css" />
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../resources/css/plugins.min.css" />

