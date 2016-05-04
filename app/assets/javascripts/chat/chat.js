Chat = (function($) {
	return {
		initEvent : function() {
		},

		loadChat : function(chat_msg) {
			var url = 'chats/load_chat_content?chat_msg=' + chat_msg;
			$.ajax({
				url : url,
				dataType : 'html',
				type : 'GET',
				success : function(response) {
					//console.log(response);
					//$('#chat_content').append(response);
				}
			});
		}
	};

})(jQuery);

$(function(){
	Chat.initEvent();
});