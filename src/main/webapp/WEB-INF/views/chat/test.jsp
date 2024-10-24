<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>직원 계층도</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>
    <style>
        #jstree {
            margin: 20px;
            width: 300px; /* 트리의 너비 조정 */
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #f9f9f9;
        }
        .jstree-themeicon {
            display: none!important; /* 기본 아이콘 숨기기 */
        }
        .jstree-person {
            margin-right: 5px; /* 아이콘과 텍스트 사이 여백 */
        }
    </style>
</head>
<body>
    <div id="jstree"></div>

    <script>
        $(document).ready(function () {
            // 트리 데이터 정의
            const treeData = [
                {
                    "text": "CEO",
                    "children": [
                        {
                            "text": "부서1",
                            "children": [
                                { "text": "팀장1" },
                                { "text": "팀장2" }
                            ]
                        },
                        {
                            "text": "부서2",
                            "children": [
                                { "text": "팀장3" }
                            ]
                        }
                    ]
                }
            ];

            // jsTree 초기화
            $('#jstree').jstree({
                'core': {
                    'data': treeData, // 트리 데이터 추가
                    'themes': {
                        'responsive': false // 반응형 디자인 비활성화
                    }
                },
                'plugins': ["wholerow"] // 선택 시 전체 행을 선택
            });

         // jstree에 로드된 후 아이콘을 추가하는 코드
            $('#jstree').on('ready.jstree', function () {
                $('#jstree .jstree-node').each(function() {
                    const icon = "<i class='fas fa-user jstree-person'></i>";
                    const nodeText = $(this).find(".jstree-anchor").html(); // 기존 텍스트 가져오기
                    $(this).find(".jstree-anchor").html(icon + nodeText); // 아이콘과 기존 텍스트 결합
                });
            });
        });
    </script>
</body>
</html>

	