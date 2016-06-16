// JavaScript Document

$().ready(function(){
  	$("#loginForm").validate({
		errorPlacement: function(error, element) {
			$(element).parent().next().append(error);
		},
		errorElement: "span",
    	rules: {
      		name: {
        		required: true,
        		email: true
      		},
     		password: {
        		required: true,
        		minlength: 4
      		}
    	},
    	messages: {  
      		name: {
        		required: "（用户名不能为空）",
        		email: "（请输入一个有效的邮箱）"
      		},
      		password: {
        		required: "（密码不能为空）",
        		minlength: "（密码至少4个字符）"
      		}
    	}
	});

	$("#expertRegisterForm").validate({ 
		errorPlacement: function(error, element) {
			$(element).parent().parent().parent().next().append(error);
		},
		errorElement: "span", 
		errorContainer: "#expertRegisterForm .validateInfo",
    	rules: {
      		userName: {
        		required: true,
        		minlength: 4
      		},
     		password: {
        		required: true,
        		minlength: 4
      		},
			passwordAgain: {
        		required: true,
        		equalTo: "#expertRegisterForm #password"
      		},
			email: {
        		required: true,
        		email: true
      		},
			idNumber: {
				minlength: 15,
				maxlength: 18
			},
			mobile: {
				minlength: 11,
				maxlength: 15
			}
    	},
    	messages: {  
      		userName: {
        		required: "（用户名不能为空）",
        		minlength: "（用户名至少4个字符）"
      		},
      		password: {
        		required: "（密码不能为空）",
        		minlength: "（密码至少4个字符）"
      		},
			passwordAgain: {
        		required: "（请再次输入密码）",
				equalTo: "（前后输入的密码不一致）"
      		},
			email: {
        		required: "（邮箱不能为空）",
        		email: "（请输入一个有效的邮箱）"
      		},
			idNumber: {
				minlength: "（最小15位数字）",
				maxlength: "（最大18位数字）"
			},
			mobile: {
				minlength: "（最小11位数字）",
				maxlength: "（最大15位数字）"
			}
    	}
	});
	
	
	$("#companyRegisterForm").validate({ 
		errorPlacement: function(error, element) {
			$(element).parent().parent().parent().next().append(error);
		},
		errorElement: "span", 
		errorContainer: "#companyRegisterForm .validateInfo",
    	rules: {
      		userName: {
        		required: true,
        		minlength: 4
      		},
     		password: {
        		required: true,
        		minlength: 4
      		},
			passwordAgain: {
        		required: true,
        		equalTo: "#companyRegisterForm #password"
      		},
			email: {
        		required: true,
        		email: true
      		},
      		businessNum: {
				minlength: 10,
				maxlength: 25
			},
			mobile: {
				minlength: 11,
				maxlength: 15
			}
    	},
    	messages: {  
      		userName: {
        		required: "（用户名不能为空）",
        		minlength: "（用户名至少4个字符）"
      		},
      		password: {
        		required: "（密码不能为空）",
        		minlength: "（密码至少4个字符）"
      		},
			passwordAgain: {
        		required: "（请再次输入密码）",
				equalTo: "（前后输入的密码不一致）"
      		},
			email: {
        		required: "（邮箱不能为空）",
        		email: "（请输入一个有效的邮箱）"
      		},
      		businessNum: {
				minlength: "（最小10位数字）",
				maxlength: "（最大25位数字）"
			},
			mobile: {
				minlength: "（最小11位数字）",
				maxlength: "（最大15位数字）"
			}
    	}
	});
});