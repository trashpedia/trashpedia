<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="resources/css/common/header.css">
</head>
<body>
    <header class="header">
        <div class="header-outer">
            <div class="header-logo">
                <a href="mainPage.html"> TRASHPEDIA </a>
            </div>
            <div class="header-nav">
                <ul>
                    <li id="menu-garbage-dictionary">
                        <div class="header-menu-div">
                            <a href="dictonary.html">쓰레기사전</a>
                        </div>
                    </li>
                    <li id="menu-community" class="header-menu-hover">
                        <div class="header-nav-background"></div>
                        <div class="header-menu-div">
                            <a href="#">커뮤니티</a>
                            <ul class="header-menu-ul">
                                <li><a href="#">공지게시판</a></li>
                                <li><a href="#">일반게시판</a></li>
                                <li><a href="#">건의게시판</a></li>
                                <li><a href="#">무료나눔게시판</a></li>
                            </ul>
                        </div>
                    </li>
                    <li id="menu-pledge" class="header-menu-hover">
                        <div class="header-menu-div">
                            <a href="practiveView.html">실천서약</a>
                            <ul class="header-menu-ul">
                                <li><a href="#">실천서약</a></li>
                                <li><a href="#">실천인증</a></li>
                            </ul>
                        </div>
                    </li>
                    <li id="menu-information" class="header-menu-hover">
                        <div class="header-menu-div">
                            <a href="#">정보자료글</a>
                            <ul class="header-menu-ul">
                                <li><a href="#">홍보 교육자료</a></li>
                                <li><a href="#">제도 정책자료</a></li>
                            </ul>
                        </div>
                    </li>
                    <li id="menu-garbage-collection">
                        <div class="header-menu-div">
                            <a href="#">집앞폐가전수거함</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="header-search header-search-main">
                <ul class="header-right">
                    <li><span class="material-symbols-outlined icon">login</span><a>login</a> </li>
                    <li><span class="material-symbols-outlined icon">person </span><a>Signup</a></li>
                    <li id="header-search-icon" ><span class="material-symbols-outlined icon">search</span><a>Search</a></li>
                </ul>
            </div>
        </div>
    <!-- 검색 팝업 -->
    <div class="search-pop-up">
        <div class="header-logo">
            <a href="mainPage.html"> TRASHPEDIA </a>
        </div>
        <span id="pop-up-X">x</span>
        <span>Search For Trash</span>
        <div class="search-area">
            <input type="search" class="search-input" placeholder="검색어를 입력하세요" autocomplete="off">
            <button type="submit" class="search-button" aria-label="Search">search</button>
        </div>  
        <div class="search-span">
            <ul> 
                <span> Popular <strong> #TAG </strong></span>
                <li>이불</li>
                <li>우산</li>
                <li>습기제거제</li>
                <li>그릇</li>
                <li>매트리스</li>
                <li>쌀</li>
            </ul>
        </div>
    </div>
    </header>
    <script>
        var header = document.querySelector('.header');

        // 검색 팝업창 내려오기
        document.getElementById('header-search-icon').addEventListener('click', function() {
            document.querySelector('.search-pop-up').style.transitionTimingFunction = 'ease-in-out';
            document.querySelector('.search-pop-up').style.transitionProperty = 'transform';
            document.querySelector('.search-pop-up').style.transitionDuration = '0.6s';
            document.querySelector('.search-pop-up').classList.toggle('active');
        });

        // 검색 팝업창 올라가기
        document.getElementById('pop-up-X').addEventListener('click', function() {
            document.querySelector('.search-pop-up').classList.toggle('active');
        });

        // 검색팝업 태그 클릭시 검색창에 입력
        var tagList = document.querySelectorAll('.search-span li');
        tagList.forEach(function(tag) {
            tag.addEventListener('click', function() {
                document.querySelector('.search-input').value = tag.textContent;
            })
        });

        // 스크롤 변화에 따른 header 스타일 변경
        window.addEventListener('scroll', function() {
            // 스크롤 위치가 50보다 크면 배경색 변경
            if (window.scrollY > 50) {
                header.style.backgroundColor = 'rgba(255, 255, 255, 0.8)';
                // header.style.backdropFilter = 'blur(5px)';
            } else {
                // 마우스 오버 상태가 아닐 때만 기본 색상으로 변경
                if (!header.classList.contains('header-mouseover')) {
                    header.style.backgroundColor = '';
                }
            }
        });
        // var headerNav = document.querySelector('.header-nav');
        // var headerMenuHover = document.querySelectorAll('.header-menu-hover');
        // var headerMenuUL = document.querySelectorAll('.header-menu-ul');
        // var headerBack = document.querySelector('.header-nav-background');

        // headerMenuHover.forEach(function (menuItem) {
        //     menuItem.addEventListener('mouseover', function () {
        //         // header.classList.add('header-mouseover');
        //         // header.style.backgroundColor = 'rgba(255, 255, 255, 0.6)';
        //         if(headerBack.style.display == 'none'){
        //             headerBack.style.display = 'flex';
        //         } else {
        //             headerBack.style.display = 'none';
        //         }
        //     });


        //     menuItem.addEventListener('mouseout', function () {
        //         header.classList.remove('header-mouseover');
        //         headerBack.style.display = 'none';
        //         if (window.scrollY <= 50) {
        //             header.style.backgroundColor = '';
        //         }
        //     });
        // });
    

        //  var menuCommunity = document.querySelector('#menu-community-ul');
        //  var menuPledge = document.querySelector('#menu-pledge-ul');
        //  var menuInformation = document.querySelector('#menu-information-ul');



        // // 메뉴에 대한 mouseover 이벤트 핸들러
        // function handleMouseOver(menu) {
        //     menu.style.display = 'flex';
        //     header.style.backgroundColor = 'rgba(255, 255, 255, 0.6)';
        // }

        // // 메뉴에 대한 mouseout 이벤트 핸들러
        // function handleMouseOut(menu) {
        //     menu.style.display = 'none';
        //     // 마우스가 벗어났을 때 header의 색상을 설정
        //     if (window.scrollY <= 50) {
        //         header.style.backgroundColor = '';
        //     }
        // }


        // 이벤트 핸들러 등록
        // document.getElementById('menu-community').addEventListener('mouseover', function() {
        //     handleMouseOver(menuCommunity);
        // });
        // // header.parentElement.addEventListener('mouseout', function() {
        // //     handleMouseOut(menuCommunity);
        // // });

        // document.getElementById('menu-pledge').addEventListener('mouseover', function() {
        //     handleMouseOver(menuPledge);
        // });
        // // document.getElementById('menu-pledge').addEventListener('mouseout', function() {
        // //     handleMouseOut(menuPledge);
        // // });

        // document.getElementById('menu-information').addEventListener('mouseover', function() {
        //     handleMouseOver(menuInformation);
        // });



        // document.getElementById('menu-information').addEventListener('mouseout', function() {
        //     handleMouseOut(menuInformation);
        // });
    </script>
</body>
</html>