<div class="row">
<div class="menuextras">
            <div class="extras">
                <ul>
                    <li class="shopping-cart-items"><i class="glyphicon glyphicon-shopping-cart icon-white"></i> 
                    <label id="messageCome">
                    <c:if test="${not empty user}">
  						<a href="getMessage.action">${messageCome} messages </a>
					</c:if>
                    </label>
                    </li>
                    <li>
                        <div class="dropdown choose-country">
                            <a class="#" data-toggle="dropdown" href="#"><img src="img/flags/gb.png"
                                                                              alt="Great Britain"> UK</a>
                            <ul class="dropdown-menu" role="menu">
                                <li role="menuitem"><a href="#"><img src="img/flags/us.png" alt="United States"> US</a>
                                </li>
                                <li role="menuitem"><a href="#"><img src="img/flags/cn.png" alt="China"> CN</a></li>
                                <li role="menuitem"><a href="#"><img src="img/flags/es.png" alt="Spain"> ES</a></li>
                            </ul>
                        </div>
                    </li>
                    <c:choose>
                    	<c:when test="${not empty user}">
                    		 <c:choose>
                    		    <c:when test="${user.role eq 'expert'}">
                    		    	<li>welcome! dear <strong> <a href="selectExpertById.action?id=${user.id}">${user.username}</a> </strong></li>
                    		    </c:when>
                    		    <c:otherwise>
                    		    	<li>welcome! dear <strong> <a href="selectCompanyById.action?id=${user.id}">${user.username}</a> </strong> </li>
                    		    </c:otherwise>
                    		 </c:choose>
                    		 <li><a href="logout.action">Log out</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		 <li><a href="page-login.jsp">Login</a></li>
                   			 <li><a href="page-register.jsp">Register</a></li>
                    	</c:otherwise>
                    </c:choose>

                </ul>
            </div>
        </div>
</div>