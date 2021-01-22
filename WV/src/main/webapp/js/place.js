			//모달 바디부분 길어질시 스크롤 가능하게
			$(document).ready(function () {
   				 $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .8) + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
			});
			
			$('#placeModal').on('hidden.bs.modal', function () {
        	//모달이 닫힐때 부모창 스크롤 방지해제
				$('body').css("overflow", "scroll");
			});
 
			$('#placeModal').on('show.bs.modal', function () {
       		// 모달이 열릴때 부모창 스크롤 방지
				$('body').css("overflow", "hidden");
			});
			
			//네비바 모임장소 클릭시 실행
			function placemodalshow(){
				$("#placeModal").modal({backdrop: 'static', keyboard: false});
                $("#modal-title").text("모임장소")
                $("#placeinsert").hide();
				$(".map_wrap").hide();
				$("#placeinsertform").show();
				$("#placeListAll").show();
				$("#placeDetail").hide();
				$("#placeform").hide();
				$("#allListShow").hide();
				$("#commentinsertdiv").hide();
				$("#pcomments").hide();
				placeListAjax();				
			}
			//모임장소 목록 가져오기
			function placeListAjax() {
				$.ajax({
					type:"post",
					url:"placeselect.do",
					success:function(result){
						console.log("실행");
						var htmlcode = "";
						if(result.length<1){
							htmlcode += '등록된 글이 없습니다.';
						}else{
							$(result).each(function(){
								htmlcode += '<div><a onclick="placeDetailAjax('+this.pno+')">'+this.ptitle+'</a><img src="images/like-img.png" style="width:20px; height:20px; margin-left: 30px;">'+this.plike+'</div><hr>';
							});
						}
						$("#placeListAll").html(htmlcode);
					},
					error:function(){
						alert("통신실패");
					}
				});
			}
			//모임장소 글 디테일 함수
			function placeDetailAjax(pno){
				var memberno = 1;
				$.ajax({
					type:"post",
					url:"placedetail.do?pno="+pno,
					success:function(dto){
						console.log("디테일");
						$("#placeListAll").hide();
						$("#placeDetail").show();
						$("#allListShow").show();
						$("#commentinsertdiv").show();
						$("#pcomments").show();
						$("#modal-title").text(dto.ptitle);
						$("#Pcommentsubmit").attr('onclick','Pcommentinsert('+pno+');')
						var likecheck = likecheckAjax(pno, memberno);
						placecommentAjax(pno);
						var htmlcode = "";
						htmlcode += '구비사항<br><div>콘센트여부: '+dto.soket+' 컴퓨터 사용가능 여부: '+dto.com+' 수용 가능 인원: '+dto.people+'</div>';	
						htmlcode += '<div>장소소개 : '+dto.pcontent+'</div><div>위치</div>';	
						htmlcode += '<div id="detailmap" style="width:95%;height:400px;margin: auto;"></div>';
						if(likecheck==1){
							htmlcode += '<div style="text-align: center;"><img id="likeimg" src="images/like-img.png" onclick="likeCancel('+pno+');" style="width:40px; height:40px; margin-left: 30px;"><span id="plike">'+dto.plike+'</span></div><hr>';
						}else if(likecheck==0){
							htmlcode += '<div style="text-align: center;"><img id="likeimg" src="images/not-like.png" onclick="likeupdate('+pno+');" style="width:40px; height:40px; margin-left: 30px;"><span id="plike">'+dto.plike+'</span></div><hr>';
						}else if(likecheck==2){
							htmlcode += '<div style="text-align: center;"><img id="likeimg" src="images/not-like.png" onclick="likeinsert('+pno+');" style="width:40px; height:40px; margin-left: 30px;"><span id="plike">'+dto.plike+'</span></div><hr>';
						}
							
						htmlcode += '<div id="comment-head"><span id="comments-count"></span> Comment(s) </div><hr>';	
						$("#placeDetail").html(htmlcode);
						detailmapload(dto.lat, dto.lng, dto.ptitle);
						
					},
					error:function(){
						alert("통신실패");
					}
				});
			}
			//모임장소 디테일 페이지에서 좋아요 누른글 취소시 실행될 함수
			function likeCancel(pno){
				var memberno = 1;
				var likeval= {"pno" : pno, "memberno" : memberno};
				var img = $("#likeimg");
				var plike = Number($("#plike").text());
				console.log(plike);
				$.ajax({
					type:"post",					
					url:"likecancel.do",
					data:JSON.stringify(likeval),
					contentType:"application/json",
					dataType:"json",
					success:function(res){
						if(res>0){
							img.attr('src','images/not-like.png');
							img.attr('onclick','likeupdate('+pno+');');
							$("#plike").text(plike-1);
						}
					},
					error:function(){
						alert("통신실패");
					}
				});
			}
			//좋아요 취소 후 다시 좋아요시 실행될 함수
			function likeupdate(pno){
				var memberno = 1;
				var likeval= {"pno" : pno, "memberno" : memberno};
				var img = $("#likeimg");
				var plike = Number($("#plike").text());
				$.ajax({
					type:"post",					
					url:"likeupdate.do",
					data:JSON.stringify(likeval),
					contentType:"application/json",
					dataType:"json",
					success:function(res){
						if(res>0){
							img.attr('src','images/like-img.png');
							img.attr('onclick','likeCancel('+pno+');');
							$("#plike").text(plike+1);
						}						
					},
					error:function(){
						alert("통신실패");
					}
				});
			}
			//좋아요를 맨 처음 누를시 실행될 함수
			function likeinsert(pno){
				var memberno = 1;
				var likeval= {"pno" : pno, "memberno" : memberno};
				var img = $("#likeimg");
				var plike = Number($("#plike").text());
				$.ajax({
					type:"post",					
					url:"likeinsert.do",
					data:JSON.stringify(likeval),
					contentType:"application/json",
					dataType:"json",
					success:function(msg){
						if(msg.insert==true){
							img.attr('src','images/like-img.png');
							img.attr('onclick','likeCancel('+pno+');');
							$("#plike").text(plike+1);
						}else{
							alert("좋아요실패!");
						}
					},
					error:function(){
						alert("통신실패");
					}
				});
			}
			//모임 장소 글쓰기 버튼 클릭시 실행
            $("#placeinsertform").click(function() {
                $("#modal-title").text("모임장소글쓰기");
				$("#placeinsertform").hide();
				$("#placeListAll").hide();
                $("#placeinsert").show();				
                $(".map_wrap").show();
				$("#placeform").show();
				$("#placeDetail").hide();
				$("#allListShow").show();
				$("#commentinsertdiv").hide();
				$("#pcomments").hide();
                relayout();
				searchPlaces();
            });
			//디테일 함수 실행시 좋아요 체크 함수
			function likecheckAjax(pno, memberno){
				console.log("체크");
				var likeval= {"pno" : pno, "memberno" : memberno};
				var res;
				$.ajax({
					type:"post",					
					url:"likecheck.do",
					data:JSON.stringify(likeval),
					contentType:"application/json",
					dataType:"json",
					async: false,
					success:function(check){
						res = check;
					},
					error:function(){
						alert("통신실패");
					}
				});
				return res;
			}
			//글쓸때 맵에서 장소 선택시 실행될 함수    
			function placeselect(){				
				var lat = $("#markerlat").val();
				var lng = $("#markerlng").val();
				var title = $("#markertitle").val();
				$("input[name=lat]").val(lat);
				$("input[name=lng]").val(lng);
				$("input[name=ptitle]").val(title);
				alert("선택되었습니다.");				
			}
			//목록으로 클릭시 실행
			function allListShow(){
                $("#modal-title").text("모임장소")
                $("#placeinsert").hide();
				$(".map_wrap").hide();
				$("#placeinsertform").show();
				placeListAjax();
				$("#placeListAll").show();
				$("#placeDetail").hide();
				$("#placeform").hide();	
				$("#allListShow").hide();
				$("#commentinsertdiv").hide();
				$("#pcomments").hide();
			}
			//글등록 함수
    		function placesubmit(){
				var ptitle=$("#ptitle").val();
				var pcontent=$("#pcontent").val();
				var soket=$("input[name=soket]:checked").val();
				var com=$("input[name=com]:checked").val();
				var people=$("input[name=people]:checked").val();
				var lat=$("#lat").val();
				var lng=$("#lng").val();
				var placeVal = {"ptitle" : ptitle, "pcontent" : pcontent, "ptitle" : ptitle, "soket" : soket, "com" : com, "people" : people, "lat" : lat, "lng" : lng};
				$.ajax({
					type:"post",
					url:"placeinsert.do",
					data:JSON.stringify(placeVal),
					contentType:"application/json",
					dataType:"json",
					success:function(msg){
						if(msg.insert==true){
							alert("등록되었습니다.");
							placemodalshow();
						}else{
							alert("등록실패!");
						}
					},
					error:function(){
						alert("통신실패");
					}
				});
			}
			//댓글 불러오기
			function placecommentAjax(pno){				
				$.ajax({
					type:"post",
					url:"pcommentlist.do?pno="+pno,
					success:function(result){
						var htmlcode = "";
						if(result.length<1){
							htmlcode += '등록된 댓글이 없습니다.';
						}else{
							$("#comments-count").text(result.length);	
							$(result).each(function(){
								htmlcode += '<div class="media text-muted pt-3" id="pcs'+this.pcno+'">';
								htmlcode += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
								htmlcode += '<span class="d-block">';			
				                htmlcode += '<strong class="text-gray-dark">' +this.pcwriter+ '</strong>';			
				                htmlcode += '<span style="padding-left: 7px; font-size: 9pt">';			
				                htmlcode += '<a href="javascript:void(0)" onclick="editPcomment(' +this.pcno+ ', \'' +this.pcwriter+ '\', \'' +this.pccontent+ '\', \'' +this.pno+ '\', \'' +this.memberno+ '\' )" style="padding-right:5px">수정</a>';			
				                htmlcode += '<a href="javascript:void(0)" onclick="deletePcomment('+this.pcno+','+this.pno+','+this.memberno+')" >삭제</a>';			
				                htmlcode += '</span>';			
				                htmlcode += '</span>';			
				                htmlcode += this.pccontent;			
				                htmlcode += '</p>';			
				                htmlcode += '</div>';
							});
						}
						$("#pcommentsList").html(htmlcode);
					},					
					error:function(){
						alert("통신실패");
					}
				});
			}
			//댓글 수정 함수
			function editPcomment(pcno,pcwriter,pccontent,pno,memberno){
				/* 댓글 작성자와 세션 회원 비교
				
				
				*/
				var htmlcode = "";
				htmlcode += '<div class="media text-muted pt-3" id="pcs'+pcno+'">';
				htmlcode += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
				htmlcode += '<span class="d-block">';
				htmlcode += '<strong class="text-gray-dark">' +pcwriter+ '</strong>';
				htmlcode += '<span style="padding-left: 7px; font-size: 9pt">';
				htmlcode += '<a href="javascript:void(0)" onclick="updatePcomment('+pcno+','+pno+')" style="padding-right:5px">저장</a>';
				htmlcode += '<a href="javascript:void(0)" onClick="placecommentAjax('+pno+');">취소<a>';
				htmlcode += '</span>';			
				htmlcode += '</span>';
				htmlcode += '<textarea name="editContent" id="editPcontent" class="form-control" rows="3">';
				htmlcode += pccontent;
				htmlcode += '</textarea>';
				htmlcode += '</p>';			
				htmlcode += '</div>';
				
				$('#pcs' + pcno).replaceWith(htmlcode);
				$('#pcs' + pcno + ' #editPcontent').focus();
			}
			//댓글 삭제 함수
			function deletePcomment(pcno, pno, memberno){
				/* 댓글 작성자와 세션 회원 비교
				
				
				*/
				if(confirm("정말로 삭제 하시겠습니까?")){
					$.ajax({
						type:"post",
						url:"deletePcomment.do?pcno="+pcno,
						success:function(res){
							if(res>0){
								placecommentAjax(pno);
							}else{
								alert("삭제실패!");
							}
						},
						error:function(){
							alert("통신실패");
						}
					});
				}else{
					return;
				}				
			}
			//댓글 수정 저장
			function updatePcomment(pcno, pno){
				var editPcontent = $("#editPcontent").val();
				var pcommentVal = {"pcno" : pcno, "pccontent" : editPcontent}
				$.ajax({
					type:"post",
					url:"updatePcomment.do",
					data:JSON.stringify(pcommentVal),
					contentType:"application/json",
					dataType:"json",
					success:function(msg){
						if(msg.insert==true){
							placecommentAjax(pno);
						}else{
							alert("등록실패!");
						}
					},
					error:function(){
						alert("통신실패");
					}
				});
			}
			//댓글 등록 함수
			function Pcommentinsert(pno){
				var placecomment = $("#placecomment").val();
				var memberno = 1;
				var pcwriter = "admin";
				var pcommentVal = {"pno" : pno, "pccontent" : placecomment, "pcwriter" : pcwriter, "memberno" : memberno};
				$.ajax({
					type:"post",
					url:"Pcommentinsert.do",
					data:JSON.stringify(pcommentVal),
					contentType:"application/json",
					dataType:"json",
					success:function(msg){
						if(msg.insert==true){
							alert("등록성공");
							$("#placecomment").val("");
						}else{
							alert("등록실패!");
						}
					},
					error:function(){
						alert("통신실패");
					}
				});
			}
			// 이부분 부터 카카오 맵 함수
			// 마커를 담을 배열입니다
			var markers = [];
	
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    	mapOption = {
	    	center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
    	};  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex:1,

		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

		    var keyword = document.getElementById('keyword').value;

		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }

		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);

		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);

		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === kakao.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
                		displayInfowindow(marker, title);					
            		});

		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };

		        })(marker, places[i].place_name);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';

		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           

		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage,
					clickable: true// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var lat = marker.getPosition().getLat();
			var lng = marker.getPosition().getLng();
			var latlng = '<input type="hidden" id="markerlat" value="'+lat+'"><input type="hidden" id="markerlng" value="'+lng+'"><input type="hidden" id="markertitle" value="'+title+'">'
		    var content = '<div style="padding:5px;z-index:1; width:200px;">' + title +"&nbsp"+ '<button onclick="placeselect();"> '+"선택"+'</button>'+latlng+'</div>';
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		//모달창 생성시 지도가 깨지므로 다시 사이징 해준다
		function resizeMap() {
		    var mapContainer = document.getElementById('map');
		    mapContainer.style.width = '100%';
		    mapContainer.style.height = '100%'; 
		}
		//지도 사이즈 변경시 실행
		function relayout() {    
		    
		    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		    map.relayout();
		}
		//여기부터 디테일 페이지 전용 맵함수들
		function detailmapload(lat, lng, ptitle){
			//디테일페이지맵 옵션
			var mapContainer2 = document.getElementById('detailmap'),  
	    		mapOption2 = { 
	        		center: new kakao.maps.LatLng(lat, lng), 
	        		level: 4 
	    	};
			//디테일 페이지 맵생성
			var map2 = new kakao.maps.Map(mapContainer2, mapOption2); 
			//저장된 장소의 위도 경도
			var markerPosition2  = new kakao.maps.LatLng(lat, lng); 
			//저장된 위도 경도로 마커 생성
			var marker2 = new kakao.maps.Marker({
			    position: markerPosition2
			});
			//만든 마커 디테일맵에 추가
			marker2.setMap(map2);
			//커스텀오버레이에 들어갈 내용(장소이름 위치 클릭시 길찾기 링크) 
			var content2 = '<div class="customoverlay">' +
			    '  <a href="https://map.kakao.com/link/to/'+ptitle+','+lat+','+lng+'" target="_blank">' +
			    '    <span class="title">'+ptitle+'</span>' +
			    '  </a>' +
			    '</div>';
			//커스텀 오버레이가 생성될 위치
			var position2 = new kakao.maps.LatLng(lat, lng);
			//커스텀 오버레이 생성
			var customOverlay = new kakao.maps.CustomOverlay({
			    map: map2,
			    position: position2,
			    content: content2 
			});
		};
		