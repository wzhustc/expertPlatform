
function deleteUnreadMessage(){
//    var deleteBtn = $("#deleteUnreadMessageBtn");
//    var deleteBtnTxt = deleteBtn.text().trim();
//    alert(deleteBtnTxt);
//    if(deleteBtnTxt=="delete messages"){
//        $("#massageUnreadTable thead tr").append("<th>select</th>");
//        $("#massageUnreadTable tbody tr")
//            .append("<td><input name='deleteSelect' type='checkbox' value='"+$(this).find("td:eq(0)").text()+"' /></td>");
//        deleteBtn.text("delete confirm");
//        deleteBtn.attr({"onclick":"confirmSubmit()"}); 
//    }
	$("#unReadTable").submit();

}


function setMessageRead(){
	alert("111");
	$('#unReadTable').attr('action', 'updateMessageRead.action');
	$("#unReadTable").submit();
}

function deleteHistoryMessage(){
    var deleteBtn = $("#deleteHistoryMessageBtn");
    var deleteBtnTxt = deleteBtn.text().trim();
    alert(deleteBtnTxt);
    if(deleteBtnTxt=="delete messages"){
        $("#historyMessageTable thead tr").append("<th>select</th>");
        $("#historyMessageTable tbody tr")
            .append("<td><input name='deleteSelect' type='checkbox' value='' /></td>");
        deleteBtn.text("delete confirm");
    }else if(deleteBtnTxt=="delete confirm"){
        $("#historyMessageTable thead tr").find("th:eq(5)").remove();
        $("#historyMessageTable tbody tr").find("td:eq(5)").remove();
        deleteBtn.text("delete messages");
    }
}
