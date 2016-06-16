<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
	<title>Index_expertPlatForm</title>
	<%@include file="linkAndMeta.jsp"%>
</head>
<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to
    improve your experience.</p>
<![endif]-->


<!-- Navigation & Bar-->
<%@include file="navAndBar.jsp"%>

<!-- Homepage Slider -->
<div class="homepage-slider">
    <div id="sequence">
        <ul class="sequence-canvas">
            <!-- Slide 1 -->
            <li class="bg4">
                <!-- Slide Title -->
                <h2 class="title">Top Experts</h2>
                <!-- Slide Text -->
                <h3 class="subtitle">You can find top experts in every field</h3>
                <!-- Slide Image -->
                <img class="slide-img" src="img/homepage-slider/slide1.png" alt="Slide 1"/>
            </li>
            <!-- End Slide 1 -->
            <!-- Slide 2 -->
            <li class="bg3">
                <!-- Slide Title -->
                <h2 class="title">Best Companies</h2>
                <!-- Slide Text -->
                <h3 class="subtitle">Seek business in collaboration with enterprises</h3>
                <!-- Slide Image -->
                <img class="slide-img" src="img/homepage-slider/slide2.png" alt="Slide 2"/>
            </li>
            <!-- End Slide 2 -->
            <!-- Slide 3 -->
            <li class="bg1">
                <!-- Slide Title -->
                <h2 class="title">Broad Platform & Short Projects </h2>
                <!-- Slide Text -->
                <h3 class="subtitle">Huge amount of short projects on broad Platform</h3>
                <!-- Slide Image -->
                <img class="slide-img" src="img/homepage-slider/slide3.png" alt="Slide 3"/>
            </li>
            <!-- End Slide 3 -->
        </ul>
        <div class="sequence-pagination-wrapper">
            <ul class="sequence-pagination">
                <li>1</li>
                <li>2</li>
                <li>3</li>
            </ul>
        </div>
    </div>
</div>
<!-- End Homepage Slider -->

<!-- search Bar -->
<div class="section section-white">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                        <button class="btn btn-secondary" type="button">Search!</button>
                        </span>
                </div>
                <h5>It's a board platform for cooperation between experts and companies.</h5>
            </div>
        </div>
    </div>
</div>
<!-- End search Bar -->

<!-- Services -->
<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="service-wrapper">
                    <img src="img/service-icon/diamond.png" alt="Service 1">

                    <h3>Experts in my Field</h3>

                    <p>You can find top experts in the field of your enterprise</p>
                    <a href="#" class="btn">Read more</a>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="service-wrapper">
                    <img src="img/service-icon/ruler.png" alt="Service 2">

                    <h3>Projects</h3>

                    <p>There are so many suitable projects you can seek on this platform.</p>
                    <a href="#" class="btn">Read more</a>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="service-wrapper">
                    <img src="img/service-icon/box.png" alt="Service 3">

                    <h3>Company</h3>

                    <p>As a expert,you can direct some companies' business with your knowledge.</p>
                    <a href="#" class="btn">Read more</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Services -->


<!-- start Expert -->
<div class="section">
    <div class="container">
        <h2>Experts recommended</h2>

        <div class="row">
            <!-- Expert -->
            <div class="testimonial col-md-3 col-sm-6">
                <!-- Expert Photo -->
                <div class="author-photo">
                    <img src="img/experts/expert1.png" alt="Author 1">
                </div>
                <div class="testimonial-bubble">
                    <blockquote>
                        <!-- Quote -->
                        <p class="quote">
                            "Dale Grossman Consulting
                            Strategic, Management, & Financial Consultant"
                        </p>
                        <!-- Author Info -->
                        <cite class="author-info">
                            - Name Surname,<br>Managing Director at <a href="#">Some Company</a>
                        </cite>
                    </blockquote>
                    <div class="sprite arrow-speech-bubble"></div>
                </div>
            </div>
            <!-- End Expert -->
            <div class="testimonial col-md-3 col-sm-6">
                <div class="author-photo">
                    <img src="img/experts/expert2.png" alt="Author 2">
                </div>
                <div class="testimonial-bubble">
                    <blockquote>
                        <p class="quote">
                            "Director of Accounting-Private Equity."
                        </p>
                        <cite class="author-info">
                            - Name Surname,<br>Managing Director at <a href="#">Some Company</a>
                        </cite>
                    </blockquote>
                    <div class="sprite arrow-speech-bubble"></div>
                </div>
            </div>
            <div class="testimonial col-md-3 col-sm-6">
                <div class="author-photo">
                    <img src="img/experts/expert1.png" alt="Author 3">
                </div>
                <div class="testimonial-bubble">
                    <blockquote>
                        <p class="quote">
                            "Executive Director - Credit Opportunities Group."
                        </p>
                        <cite class="author-info">
                            - Name Surname,<br>Managing Director at <a href="#">Some Company</a>
                        </cite>
                    </blockquote>
                    <div class="sprite arrow-speech-bubble"></div>
                </div>
            </div>
            <div class="testimonial col-md-3 col-sm-6">
                <div class="author-photo">
                    <img src="img/experts/expert2.png" alt="Author 3">
                </div>
                <div class="testimonial-bubble">
                    <blockquote>
                        <p class="quote">
                            "Executive Director - Credit Opportunities Group."
                        </p>
                        <cite class="author-info">
                            - Name Surname,<br>Managing Director at <a href="#">Some Company</a>
                        </cite>
                    </blockquote>
                    <div class="sprite arrow-speech-bubble"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Expert -->

<!-- Projects published -->
<div class="section">
    <div class="container">
        <h2>Projects published</h2>

        <div class="row">
            <!--  Projects Wrapper -->
            <div class="pricing-wrapper col-md-12">
                <!-- Projects Plan -->
                <div class="pricing-plan pricing-plan-promote">
                    <!-- Projects Plan Ribbon -->
                    <div class="ribbon-wrapper">
                        <div class="price-ribbon ribbon-red">Popular</div>
                    </div>
                    <h2 class="pricing-plan-title">Starter</h2>

                    <p class="pricing-plan-price">FREE</p>
                    <!-- Projects Plan Features -->
                    <ul class="pricing-plan-features">
                        <li><strong>1</strong> user</li>
                        <li><strong>Unlimited</strong> projects</li>
                        <li><strong>2GB</strong> storage</li>
                    </ul>
                    <a href="index.html" class="btn">MORE</a>
                </div>
                <!-- End Projects Plan -->
                <div class="pricing-plan">
                    <h2 class="pricing-plan-title">Advanced</h2>

                    <p class="pricing-plan-price">$49<span>/mo</span></p>
                    <ul class="pricing-plan-features">
                        <li><strong>10</strong> users</li>
                        <li><strong>Unlimited</strong> projects</li>
                        <li><strong>20GB</strong> storage</li>
                    </ul>
                    <a href="index.html" class="btn">MORE</a>
                </div>
                <!-- Promoted Pricing Plan -->
                <div class="pricing-plan pricing-plan-promote">
                    <h2 class="pricing-plan-title">Premium</h2>
                    <div class="ribbon-wrapper">
                        <div class="price-ribbon ribbon-red">recommended</div>
                    </div>
                    <p class="pricing-plan-price">$99<span>/mo</span></p>
                    <ul class="pricing-plan-features">
                        <li><strong>Unlimited</strong> users</li>
                        <li><strong>Unlimited</strong> projects</li>
                        <li><strong>100GB</strong> storage</li>
                    </ul>
                    <a href="index.html" class="btn">MORE</a>
                </div>
                <div class="pricing-plan">
                    <!-- Pricing Plan Ribbon -->
                    <div class="ribbon-wrapper">
                        <div class="price-ribbon ribbon-green">New</div>
                    </div>
                    <h2 class="pricing-plan-title">Mega</h2>

                    <p class="pricing-plan-price">$199<span>/mo</span></p>
                    <ul class="pricing-plan-features">
                        <li><strong>Unlimited</strong> users</li>
                        <li><strong>Unlimited</strong> projects</li>
                        <li><strong>100GB</strong> storage</li>
                    </ul>
                    <a href="index.html" class="btn">Order Now</a>
                </div>
            </div>
            <!-- End Pricing Plans Wrapper -->
        </div>
    </div>
</div>
<!-- End Projects published -->

<!-- Our Companies -->
<div class="section">
    <div class="container">
        <h2>Info of Companies</h2>

        <div class="clients-logo-wrapper text-center row">
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/canon.png"
                                                                              alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/cisco.png"
                                                                              alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/dell.png"
                                                                              alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/ea.png" alt="Client Name"></a>
            </div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/ebay.png"
                                                                              alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/facebook.png"
                                                                              alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/google.png"
                                                                              alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/hp.png" alt="Client Name"></a>
            </div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/microsoft.png"
                                                                              alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/mysql.png"
                                                                              alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/sony.png"
                                                                              alt="Client Name"></a></div>
            <div class="col-lg-1 col-md-1 col-sm-3 col-xs-6"><a href="#"><img src="img/logos/yahoo.png"
                                                                              alt="Client Name"></a></div>
        </div>
    </div>
</div>
<!-- End Our Clients -->
<!-- Footer -->
<%@include file="footer.jsp"%>

</body>
</html>
