<%@ Page Language="C#" AutoEventWireup="true" CodeFile="module_TrangChu.aspx.cs" Inherits="web_module_module_TrangChu" %>

<!DOCTYPE html>
<%--<html lang="en">--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Complete Responsive Fashion Website Design Tutorial</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

    <!-- custom css file link  -->
    <%--<link rel="stylesheet" href="css/style.css">--%>
</head>
<body>
    <form id="form1" runat="server">
        <!-- header section starts  -->

        <header class="header">

            <a href="/Shop-Now" class="logo"><i class="fas fa-shopping-cart"></i>shop </a>

            <nav class="navbar">
                <a href="#home">home</a>
                <a href="#products">products</a>
                <a href="#featured">featured</a>
                <a href="#review">review</a>
                <a href="#contact">contact</a>
                <a href="#blogs">blogs</a>
            </nav>

            <div class="icons">
                <div id="menu-btn" class="fas fa-bars"></div>
                <a id="search-btn" class="fas fa-search"></a>
                <a href="/gio-hang" class="fas fa-shopping-cart"></a>
                <%--<a href="#" class="fas fa-heart"></a>--%>
            </div>

            <%--<div action="" class="search-form">
                <input type="search" name="" placeholder="search here..." id="search-box"/>
                <label for="search-box" class="fas fa-search"></label>
            </div>--%>

        </header>

        <!-- header section ends -->

        <!-- home section starts  -->

        <section class="home" id="home">

            <div class="swiper home-slider">

                <div class="swiper-wrapper">

                    <asp:Repeater runat="server" ID="rpSlide">
                        <ItemTemplate>
                            <div class="swiper-slide slide" style="background: url(<%#Eval("slide_image")%>) no-repeat">
                                <div class="content">
                                    <span><%#Eval("slide_title")%></span>
                                    <h3><%#Eval("slide_title1")%></h3>
                                    <a href="/Shop-Now" class="btn">shop now</a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>

            </div>

        </section>

        <!-- home section ends -->

        <!-- banner section starts  -->

        <section class="banner-container">

            <div class="banner">
                <img src="web_module/image/shop_banner_img1.jpg" alt="">
                <div class="content">
                    <span>special offer</span>
                    <h3>upto 50% off</h3>
                    <a href="/Shop-Now" class="btn">shop now</a>
                </div>
            </div>

            <div class="banner">
                <img src="web_module/image/shop_banner_img2.jpg" alt="">
                <div class="content">
                    <span>special offer</span>
                    <h3>upto 50% off</h3>
                    <a href="/Shop-Now" class="btn">shop now</a>
                </div>
            </div>

        </section>

        <!-- banner section ends -->

        <!-- products section starts  -->

        <section class="products" id="products">

            <h1 class="heading">exclusive <span>products</span> </h1>

            <div class="filter-buttons">
                <div class="buttons active" data-filter="all">all</div>
                <div class="buttons" data-filter="arrivals">new arrivals</div>
                <div class="buttons" data-filter="featured">featured</div>
                <div class="buttons" data-filter="special">special offer</div>
                <div class="buttons" data-filter="seller">best seller</div>
            </div>

            <div class="box-container">
                <asp:Repeater runat="server" ID="rpProduct">
                    <ItemTemplate>
                        <div class="box" data-item="featured">
                            <div class="icons">
                                <a href="#" class="fas fa-shopping-cart"></a>
                                
                            </div>
                            <div class="image">
                                <img src="<%#Eval("product_image") %>" alt="">
                            </div>
                            <div class="content">
                                <h3><%#Eval("product_title") %></h3>
                                <div class="price">
                                    <div class="amount"><%#Eval("product_price") %></div>
                                    <div class="cut"><%#Eval("product_price_new") %></div>
                                    <div class="offer"><%#Eval("product_promotions") %>% off</div>
                                </div>
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <span>(50)</span>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </section>

        <!-- products section ends -->

        <!-- deal section starts  -->

        <section class="deal">

            <div class="image">
                <img src="web_module/image/tranding_img.png" alt="">
            </div>

            <div class="content">
                <span>new season trending!</span>
                <h3>best summer collection</h3>
                <p>sale get up to 50% off</p>
                <a href="/Shop-Now" class="btn">shop now</a>
            </div>

        </section>

        <!-- deal section ends -->

        <!-- featured section starts  -->

        <section class="featured" id="featured">

            <h1 class="heading"><span>featured</span> products </h1>

            <div class="swiper featured-slider">

                <div class="swiper-wrapper">
                    <asp:Repeater runat="server" ID="rpFeaturedProduct">
                        <ItemTemplate>
                            <div class="swiper-slide slide">
                                <div class="icons">
                                    <a href="#" class="fas fa-shopping-cart"></a>
                                    
                                </div>
                                <div class="image">
                                    <img src="<%#Eval("product_image") %>" alt="">
                                </div>
                                <div class="content">
                                    <h3><%#Eval("product_title") %></h3>
                                    <div class="price">
                                        <div class="amount"><%#Eval("product_price") %></div>
                                        <div class="cut"><%#Eval("product_price_new") %></div>
                                        <div class="offer"><%#Eval("product_promotions") %>% off</div>
                                    </div>
                                    <div class="stars">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <span>(50)</span>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>

        </section>

        <!-- featured section ends -->

        <!-- reviews section starts  -->

        <section class="review" id="review">

            <h1 class="heading">client's <span>review</span> </h1>

            <div class="swiper review-slide">

                <div class="swiper-wrapper">

                    <div class="swiper-slide slide">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur veniam deserunt praesentium natus quibusdam ea nam commodi.</p>
                        <div class="user">
                            <img src="web_module/image/pic-1.png" alt="">
                            <div class="info">
                                <h3>john deo</h3>
                                <span>happy client</span>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur veniam deserunt praesentium natus quibusdam ea nam commodi.</p>
                        <div class="user">
                            <img src="web_module/image/pic-2.png" alt="">
                            <div class="info">
                                <h3>john deo</h3>
                                <span>happy client</span>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur veniam deserunt praesentium natus quibusdam ea nam commodi.</p>
                        <div class="user">
                            <img src="web_module/image/pic-3.png" alt="">
                            <div class="info">
                                <h3>john deo</h3>
                                <span>happy client</span>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur veniam deserunt praesentium natus quibusdam ea nam commodi.</p>
                        <div class="user">
                            <img src="web_module/image/pic-4.png" alt="">
                            <div class="info">
                                <h3>john deo</h3>
                                <span>happy client</span>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur veniam deserunt praesentium natus quibusdam ea nam commodi.</p>
                        <div class="user">
                            <img src="web_module/image/pic-5.png" alt="">
                            <div class="info">
                                <h3>john deo</h3>
                                <span>happy client</span>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur veniam deserunt praesentium natus quibusdam ea nam commodi.</p>
                        <div class="user">
                            <img src="web_module/image/pic-6.png" alt="">
                            <div class="info">
                                <h3>john deo</h3>
                                <span>happy client</span>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </section>

        <!-- reviews section ends -->

        <!-- contact section starts  -->

        <section class="contact" id="contact">

            <h1 class="heading"><span>contact</span> us </h1>

            <div class="icons-container">

                <div class="icons">
                    <i class="fas fa-map-marker-alt"></i>
                    <h3>address</h3>
                    <p>451 Tôn Đản,Hoà An, Cẩm Lệ, Đà Nẵng</p>
                </div>

                <div class="icons">
                    <i class="fas fa-envelope"></i>
                    <h3>email</h3>
                    <p>vinhquytrinh@gmail.com</p>
                    <p>nhanle.02092002@gmail.com</p>
                    <p>tranvanphilong@gmail.com</p>
                </div>

                <div class="icons">
                    <i class="fas fa-phone"></i>
                    <h3>phone</h3>
                    <p>0905163918</p>
                    <p>0905163918</p>
                </div>

            </div>

            <div class="row">

                <div class="" action="">
                    <h3>get in touch</h3>
                    <div class="inputBox">
                        <input type="text" placeholder="your name">
                        <input type="email" placeholder="your email">
                    </div>
                    <div class="inputBox">
                        <input type="number" placeholder="your number">
                        <input type="text" placeholder="your subject">
                    </div>
                    <textarea placeholder="your message" cols="30" rows="10"></textarea>
                    <input type="submit" value="send message" class="btn">
                </div>

                <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30153.788252261566!2d72.82321484621745!3d19.141690214227783!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b63aceef0c69%3A0x2aa80cf2287dfa3b!2sJogeshwari%20West%2C%20Mumbai%2C%20Maharashtra%20400047!5e0!3m2!1sen!2sin!4v1633431163028!5m2!1sen!2sin" allowfullscreen="" loading="lazy"></iframe>

            </div>

        </section>

        <!-- contact section ends -->

        <!-- blogs  section starts  -->

        <section class="blogs" id="blogs">

            <h1 class="heading">our <span>blogs</span></h1>

            <div class="swiper blogs-slider">

                <div class="swiper-wrapper">

                    <div class="swiper-slide slide">
                        <div class="image">
                            <img src="web_module/image/blog-1.jpg" alt="">
                        </div>
                        <div class="content">
                            <h3>blog title goes here</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore.</p>
                            <a href="#" class="btn">read more</a>
                            <div class="icons">
                                <a href="#"><i class="fas fa-calendar"></i>21st may, 2021 </a>
                                <a href="#"><i class="fas fa-user"></i>by admin </a>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <div class="image">
                            <img src="web_module/image/blog-2.jpg" alt="">
                        </div>
                        <div class="content">
                            <h3>blog title goes here</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore.</p>
                            <a href="#" class="btn">read more</a>
                            <div class="icons">
                                <a href="#"><i class="fas fa-calendar"></i>21st may, 2021 </a>
                                <a href="#"><i class="fas fa-user"></i>by admin </a>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <div class="image">
                            <img src="web_module/image/blog-3.jpg" alt="">
                        </div>
                        <div class="content">
                            <h3>blog title goes here</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore.</p>
                            <a href="#" class="btn">read more</a>
                            <div class="icons">
                                <a href="#"><i class="fas fa-calendar"></i>21st may, 2021 </a>
                                <a href="#"><i class="fas fa-user"></i>by admin </a>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <div class="image">
                            <img src="web_module/image/blog-4.jpg" alt="">
                        </div>
                        <div class="content">
                            <h3>blog title goes here</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore.</p>
                            <a href="#" class="btn">read more</a>
                            <div class="icons">
                                <a href="#"><i class="fas fa-calendar"></i>21st may, 2021 </a>
                                <a href="#"><i class="fas fa-user"></i>by admin </a>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide slide">
                        <div class="image">
                            <img src="web_module/image/blog-5.jpg" alt="">
                        </div>
                        <div class="content">
                            <h3>blog title goes here</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore.</p>
                            <a href="#" class="btn">read more</a>
                            <div class="icons">
                                <a href="#"><i class="fas fa-calendar"></i>21st may, 2021 </a>
                                <a href="#"><i class="fas fa-user"></i>by admin </a>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>

            </div>

        </section>

        <!-- blogs  section ends -->

        <!-- footer section starts  -->

        <div>
            <section class="footer">

                <div class="box-container">

                    <div class="box">
                        <h3>about us</h3>
                        <p>Địa chỉ: 451 Tôn Đản,Hoà An, Cẩm Lệ, Đà Nẵng</p>
                        <p>Số điện thoại: 0905163918</p>
                        <p>Email: support@gmail.com</p>
                    </div>

                    <div class="box">
                        <h3>Hỗ trợ khách hàng</h3>
                        <a href="#"><i class="fas fa-arrow-right"></i>Về chúng tôi </a>
                        <a href="#"><i class="fas fa-arrow-right"></i>Hệ thống cửa hàng </a>
                        <a href="#"><i class="fas fa-arrow-right"></i>Gọi điện đặt hàng </a>
                    </div>

                    <div class="box">
                        <h3>Chính sách</h3>
                        <a href="#"><i class="fas fa-arrow-right"></i>Chính sách bán hàng </a>
                        <a href="#"><i class="fas fa-arrow-right"></i>Chính sách đổi trả </a>
                        <a href="#"><i class="fas fa-arrow-right"></i>Chính sách giao hàng </a>
                    </div>

                    <div class="box">
                        <h3>Tổng đài hỗ trợ</h3>
                        <a href="#"><i class="fas fa-arrow-right"></i>Gọi mua hàng: 19006750 (8h-20h) </a>
                        <a href="#"><i class="fas fa-arrow-right"></i>Gọi mua hàng: 19006750 (8h-20h) </a>
                        <a href="#"><i class="fas fa-arrow-right"></i>Gọi mua hàng: 19006750 (8h-20h) </a>
                    </div>

                </div>

                <div class="share">
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-pinterest"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                    <a href="#" class="fab fa-instagram"></a>
                </div>

                <div class="credit">&copy; copyright @ 2022 by <span>Trịnh Xuân Vinh Quy</span> </div>

            </section>
        </div>

        <!-- footer section ends -->


        <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

        <!-- custom js file link -->
        <%--<script src="js/script.js"></script>--%>
        <div style="display: block">
            <input type="text" id="txtIdPr" name="name" value="" />
        </div>
    </form>
    <script>


        let searchForm = document.querySelector('.search-form');

        document.querySelector('#search-btn').onclick = () => {
            searchForm.classList.toggle('active');
            navbar.classList.remove('active');
        }

        let navbar = document.querySelector('.navbar');

        document.querySelector('#menu-btn').onclick = () => {
            navbar.classList.toggle('active');
            searchForm.classList.remove('active');
        }

        window.onscroll = () => {
            searchForm.classList.remove('active');
            navbar.classList.remove('active');
        }

        let filterBtn = document.querySelectorAll('.filter-buttons .buttons');
        let filterItem = document.querySelectorAll('.products .box-container .box');

        filterBtn.forEach(button => {

            button.onclick = () => {
                filterBtn.forEach(btn => btn.classList.remove('active'));
                button.classList.add('active');

                let dataFilter = button.getAttribute('data-filter');

                filterItem.forEach(item => {

                    item.classList.remove('active');
                    item.classList.add('hide');

                    if (item.getAttribute('data-item') == dataFilter || dataFilter == 'all') {
                        item.classList.remove('hide');
                        item.classList.add('active');
                    }

                });

            };

        });

        var swiper = new Swiper(".home-slider", {
            centeredSlides: true,
            loop: true,
            autoplay: {
                delay: 9500,
                disableOnInteraction: false,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });

        var swiper = new Swiper(".featured-slider", {
            centeredSlides: true,
            loop: true,
            spaceBetween: 20,
            autoplay: {
                delay: 9500,
                disableOnInteraction: false,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            breakpoints: {
                0: {
                    slidesPerView: 1,
                },
                450: {
                    slidesPerView: 2,
                },
                768: {
                    slidesPerView: 3,
                },
                1200: {
                    slidesPerView: 4,
                },
            },
        });

        var swiper = new Swiper(".review-slide", {
            loop: true,
            spaceBetween: 20,
            autoplay: {
                delay: 9500,
                disableOnInteraction: false,
            },
            breakpoints: {
                0: {
                    slidesPerView: 1,
                },
                768: {
                    slidesPerView: 2,
                },
            },
        });

        var swiper = new Swiper(".blogs-slider", {
            centeredSlides: true,
            loop: true,
            spaceBetween: 20,
            autoplay: {
                delay: 9500,
                disableOnInteraction: false,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            breakpoints: {
                0: {
                    slidesPerView: 1,
                },
                768: {
                    slidesPerView: 2,
                },
                1200: {
                    slidesPerView: 3,
                },
            },
        });
    </script>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,500;0,600;1,100;1,300&display=swap");

        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            outline: none;
            border: none;
            text-decoration: none;
            text-transform: capitalize;
            -webkit-transition: .2s linear;
            transition: .2s linear;
        }

        .header .icons div,
        .header .icons a, .header .search-form label, .products .box-container .box .icons a, .featured .featured-slider .slide .icons a, .contact .icons-container .icons i {
            color: #fff;
            cursor: pointer;
            -webkit-text-stroke: 0.1rem #130f40;
        }

            .header .icons div:hover,
            .header .icons a:hover, .header .search-form label:hover, .products .box-container .box .icons a:hover, .featured .featured-slider .slide .icons a:hover, .contact .icons-container .icons i:hover {
                -webkit-text-stroke: 0.1rem #eb4d4b;
            }

        html {
            font-size: 62.5%;
            scroll-behavior: smooth;
            scroll-padding-top: 7rem;
            overflow-x: hidden;
        }

            html::-webkit-scrollbar {
                width: 1rem;
            }

            html::-webkit-scrollbar-track {
                background: #fff;
            }

            html::-webkit-scrollbar-thumb {
                background: #eb4d4b;
                border-radius: 5rem;
            }

        section {
            padding: 2rem 9%;
        }

        .heading {
            font-size: 3.5rem;
            color: #130f40;
            padding-bottom: 2rem;
            text-align: center;
        }

            .heading span {
                color: #eb4d4b;
            }

        .btn {
            display: inline-block;
            margin-top: 1rem;
            padding: .9rem 3rem;
            border-radius: .5rem;
            background: #eb4d4b;
            color: #fff;
            font-size: 1.7rem;
            cursor: pointer;
        }

            .btn:hover {
                background: #130f40;
            }

        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
            padding: 2rem 9%;
            background: #fff;
        }

            .header .logo {
                font-size: 2.5rem;
                color: #130f40;
                font-weight: bolder;
            }

                .header .logo i {
                    color: #eb4d4b;
                }

            .header .navbar a {
                font-size: 1.7rem;
                color: #666;
                margin: 0 1rem;
            }

                .header .navbar a:hover {
                    color: #eb4d4b;
                }

            .header .icons div,
            .header .icons a {
                font-size: 2.5rem;
                margin-left: 2rem;
            }

            .header .search-form {
                position: absolute;
                top: 115%;
                right: -105%;
                width: 50rem;
                height: 5.5rem;
                background: #fff;
                border-radius: .5rem;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                overflow: hidden;
                -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
                border: 0.1rem solid rgba(0, 0, 0, 0.3);
            }

                .header .search-form.active {
                    right: 2rem;
                    -webkit-transition: .4s linear;
                    transition: .4s linear;
                }

                .header .search-form input {
                    height: 100%;
                    width: 100%;
                    font-size: 1.6rem;
                    text-transform: none;
                    color: #130f40;
                    padding: 0 1.2rem;
                }

                .header .search-form label {
                    font-size: 2.2rem;
                    margin-right: 1.7rem;
                }

        #menu-btn {
            display: none;
        }

        .home {
            padding: 0;
            padding-top: 7.6rem;
        }

            .home .home-slider .slide {
                min-height: 65vh;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                padding: 2rem;
                padding-left: 7%;
                background-size: cover !important;
                background-position: center !important;
            }

                .home .home-slider .slide .content span {
                    font-size: 2rem;
                    color: #666;
                }

                .home .home-slider .slide .content h3 {
                    font-size: 6rem;
                    color: #130f40;
                    padding-top: .5rem;
                }

            .home .swiper-button-next {
                top: 90%;
                right: 2rem;
            }

            .home .swiper-button-prev {
                top: 90%;
                right: 8rem;
                left: auto;
            }

        .swiper-button-next,
        .swiper-button-prev {
            height: 5rem;
            width: 5rem;
            border-radius: .5rem;
            background: #fff;
            -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            border: 0.1rem solid rgba(0, 0, 0, 0.3);
            color: #130f40;
        }

            .swiper-button-next:hover,
            .swiper-button-prev:hover {
                background: #130f40;
                color: #fff;
            }

            .swiper-button-next::after,
            .swiper-button-prev::after {
                font-size: 2rem;
            }

        .banner-container {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            gap: 1.5rem;
            padding-top: 5rem;
            padding-bottom: 5rem;
        }

            .banner-container .banner {
                -webkit-box-flex: 1;
                -ms-flex: 1 1 42rem;
                flex: 1 1 42rem;
                overflow: hidden;
                height: 30rem;
                position: relative;
            }

                .banner-container .banner img {
                    height: 100%;
                    width: 100%;
                    -o-object-fit: cover;
                    object-fit: cover;
                }

                .banner-container .banner:hover img {
                    -webkit-transform: scale(1.2);
                    transform: scale(1.2);
                }

                .banner-container .banner .content {
                    position: absolute;
                    top: 50%;
                    right: 5rem;
                    -webkit-transform: translateY(-50%);
                    transform: translateY(-50%);
                }

                    .banner-container .banner .content span {
                        font-size: 2rem;
                        color: #666;
                    }

                    .banner-container .banner .content h3 {
                        font-size: 3.2rem;
                        color: #130f40;
                        padding-top: .5rem;
                    }

        @-webkit-keyframes fadeUp {
            0% {
                -webkit-transform: translateY(5rem);
                transform: translateY(5rem);
                opacity: 0;
            }
        }

        @keyframes fadeUp {
            0% {
                -webkit-transform: translateY(5rem);
                transform: translateY(5rem);
                opacity: 0;
            }
        }

        .products .filter-buttons {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            padding-bottom: 2.5rem;
            gap: 2rem;
        }

            .products .filter-buttons .buttons {
                font-size: 1.7rem;
                color: #666;
                cursor: pointer;
            }

                .products .filter-buttons .buttons:hover, .products .filter-buttons .buttons.active {
                    color: #eb4d4b;
                }

        .products .box-container {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            gap: 1.5rem;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
        }

            .products .box-container .box {
                width: 27rem;
                border-radius: .5rem;
                overflow: hidden;
                position: relative;
                -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
                border: 0.1rem solid rgba(0, 0, 0, 0.3);
            }

                .products .box-container .box.hide {
                    display: none;
                }

                .products .box-container .box.active {
                    -webkit-animation: fadeUp .4s linear;
                    animation: fadeUp .4s linear;
                }

                .products .box-container .box .icons {
                    display: -webkit-box;
                    display: -ms-flexbox;
                    display: flex;
                    -webkit-box-align: center;
                    -ms-flex-align: center;
                    align-items: center;
                    -webkit-box-pack: center;
                    -ms-flex-pack: center;
                    justify-content: center;
                    background: rgba(0, 0, 0, 0.7);
                    height: 35rem;
                    width: 100%;
                    position: absolute;
                    top: 0;
                    left: 0;
                    gap: .5rem;
                    -webkit-transform: scale(0);
                    transform: scale(0);
                    z-index: 1;
                }

                    .products .box-container .box .icons a {
                        font-size: 2rem;
                        height: 5rem;
                        width: 5rem;
                        line-height: 5rem;
                        text-align: center;
                        background: #fff;
                        border-radius: .5rem;
                    }

                .products .box-container .box:hover .icons {
                    -webkit-transform: scale(1);
                    transform: scale(1);
                }

                .products .box-container .box .image {
                    height: 35rem;
                    width: 100%;
                    overflow: hidden;
                }

                    .products .box-container .box .image img {
                        height: 100%;
                        width: 100%;
                        -o-object-fit: cover;
                        object-fit: cover;
                    }

                .products .box-container .box:hover .image img {
                    -webkit-transform: scale(1.1);
                    transform: scale(1.1);
                }

                .products .box-container .box .content {
                    padding: 1rem 1.5rem;
                }

                    .products .box-container .box .content h3 {
                        font-size: 2rem;
                        color: #130f40;
                        font-weight: normal;
                    }

                    .products .box-container .box .content .price {
                        padding: .5rem 0;
                        display: -webkit-box;
                        display: -ms-flexbox;
                        display: flex;
                        gap: .5rem;
                        -webkit-box-align: center;
                        -ms-flex-align: center;
                        align-items: center;
                    }

                        .products .box-container .box .content .price .amount {
                            font-size: 2.2rem;
                            font-weight: bolder;
                            color: #130f40;
                        }

                        .products .box-container .box .content .price .cut {
                            font-size: 1.5rem;
                            text-decoration: line-through;
                            color: #666;
                        }

                        .products .box-container .box .content .price .offer {
                            font-size: 2rem;
                            color: #eb4d4b;
                        }

                    .products .box-container .box .content .stars {
                        font-size: 1.7rem;
                    }

                        .products .box-container .box .content .stars i {
                            color: gold;
                        }

                        .products .box-container .box .content .stars span {
                            color: #666;
                        }

        .deal {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            gap: 2rem;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(20%, #fff), color-stop(20.1%, #f9f9f9));
            background: linear-gradient(#fff 20%, #f9f9f9 20.1%);
        }

            .deal .image {
                -webkit-box-flex: 1;
                -ms-flex: 1 1 42rem;
                flex: 1 1 42rem;
            }

                .deal .image img {
                    width: 40rem;
                }

            .deal .content {
                -webkit-box-flex: 1;
                -ms-flex: 1 1 42rem;
                flex: 1 1 42rem;
            }

                .deal .content span {
                    color: #eb4d4b;
                    font-size: 1.7rem;
                }

                .deal .content h3 {
                    color: #130f40;
                    font-size: 3rem;
                    padding: .5rem 0;
                }

                .deal .content p {
                    color: #666;
                    font-size: 2rem;
                }

        .featured .featured-slider .slide {
            border-radius: .5rem;
            overflow: hidden;
            position: relative;
            -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            border: 0.1rem solid rgba(0, 0, 0, 0.3);
        }

            .featured .featured-slider .slide .icons {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
                background: rgba(0, 0, 0, 0.7);
                height: 35rem;
                width: 100%;
                position: absolute;
                top: 0;
                left: 0;
                gap: .5rem;
                -webkit-transform: scale(0);
                transform: scale(0);
                z-index: 1;
            }

                .featured .featured-slider .slide .icons a {
                    font-size: 2rem;
                    height: 5rem;
                    width: 5rem;
                    line-height: 5rem;
                    text-align: center;
                    background: #fff;
                    border-radius: .5rem;
                }

            .featured .featured-slider .slide:hover .icons {
                -webkit-transform: scale(1);
                transform: scale(1);
            }

            .featured .featured-slider .slide .image {
                height: 35rem;
                width: 100%;
                overflow: hidden;
            }

                .featured .featured-slider .slide .image img {
                    height: 100%;
                    width: 100%;
                    -o-object-fit: cover;
                    object-fit: cover;
                }

            .featured .featured-slider .slide:hover .image img {
                -webkit-transform: scale(1.1);
                transform: scale(1.1);
            }

            .featured .featured-slider .slide .content {
                padding: 1rem 1.5rem;
            }

                .featured .featured-slider .slide .content h3 {
                    font-size: 2rem;
                    color: #130f40;
                    font-weight: normal;
                }

                .featured .featured-slider .slide .content .price {
                    padding: .5rem 0;
                    display: -webkit-box;
                    display: -ms-flexbox;
                    display: flex;
                    gap: .5rem;
                    -webkit-box-align: center;
                    -ms-flex-align: center;
                    align-items: center;
                }

                    .featured .featured-slider .slide .content .price .amount {
                        font-size: 2.2rem;
                        font-weight: bolder;
                        color: #130f40;
                    }

                    .featured .featured-slider .slide .content .price .cut {
                        font-size: 1.5rem;
                        text-decoration: line-through;
                        color: #666;
                    }

                    .featured .featured-slider .slide .content .price .offer {
                        font-size: 2rem;
                        color: #eb4d4b;
                    }

                .featured .featured-slider .slide .content .stars {
                    font-size: 1.7rem;
                }

                    .featured .featured-slider .slide .content .stars i {
                        color: gold;
                    }

                    .featured .featured-slider .slide .content .stars span {
                        color: #666;
                    }

        .review {
            padding-top: 5rem;
            padding-bottom: 5rem;
            background: #f9f9f9;
        }

            .review .slide {
                border-radius: .5rem;
                background: #fff;
                border: 0.1rem solid rgba(0, 0, 0, 0.3);
                padding: 2rem;
                text-align: center;
                -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            }

                .review .slide p {
                    font-size: 1.4rem;
                    color: #666;
                    line-height: 2;
                }

                .review .slide .user {
                    padding-top: 2rem;
                    display: -webkit-box;
                    display: -ms-flexbox;
                    display: flex;
                    -webkit-box-align: center;
                    -ms-flex-align: center;
                    align-items: center;
                    gap: 1rem;
                    -webkit-box-pack: center;
                    -ms-flex-pack: center;
                    justify-content: center;
                }

                    .review .slide .user img {
                        height: 7rem;
                        width: 7rem;
                        -o-object-fit: cover;
                        object-fit: cover;
                        border-radius: 50%;
                    }

                    .review .slide .user h3 {
                        font-size: 2.2rem;
                        color: #130f40;
                    }

                    .review .slide .user span {
                        font-size: 1.5rem;
                        color: #eb4d4b;
                    }

        .contact .icons-container {
            display: -ms-grid;
            display: grid;
            -ms-grid-columns: (minmax(25rem, 1fr))[auto-fit];
            grid-template-columns: repeat(auto-fit, minmax(25rem, 1fr));
            gap: 1.5rem;
        }

            .contact .icons-container .icons {
                padding: 2rem;
                border-radius: .5rem;
                border: 0.1rem solid rgba(0, 0, 0, 0.3);
                -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
                text-align: center;
            }

                .contact .icons-container .icons i {
                    font-size: 2.5rem;
                    height: 6rem;
                    width: 6rem;
                    line-height: 6rem;
                    border: 0.1rem solid rgba(0, 0, 0, 0.3);
                    border-radius: 50%;
                }

                .contact .icons-container .icons h3 {
                    font-size: 2.2rem;
                    padding: 1rem 0;
                    color: #130f40;
                }

                .contact .icons-container .icons p {
                    font-size: 1.5rem;
                    line-height: 2;
                    color: #666;
                }

        .contact .row {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            gap: 1.5rem;
            margin-top: 2rem;
        }

            .contact .row div {
                -webkit-box-flex: 1;
                -ms-flex: 1 1 42rem;
                flex: 1 1 42rem;
                padding: 2rem;
                border: 0.1rem solid rgba(0, 0, 0, 0.3);
                -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
                border-radius: .5rem;
            }

                .contact .row div h3 {
                    font-size: 3rem;
                    padding-bottom: 1rem;
                    color: #130f40;
                }

                .contact .row div .inputBox {
                    display: -webkit-box;
                    display: -ms-flexbox;
                    display: flex;
                    -ms-flex-wrap: wrap;
                    flex-wrap: wrap;
                    -webkit-box-pack: justify;
                    -ms-flex-pack: justify;
                    justify-content: space-between;
                }

                    .contact .row div .inputBox input {
                        width: 49%;
                    }

                    .contact .row div .inputBox input,
                    .contact .row div textarea {
                        border: 0.1rem solid rgba(0, 0, 0, 0.3);
                        border-radius: .5rem;
                        padding: 1rem 1.2rem;
                        font-size: 1.6rem;
                        color: #130f40;
                        text-transform: none;
                        margin: .7rem 0;
                    }

                .contact .row div textarea {
                    height: 15rem;
                    resize: none;
                    width: 100%;
                }

            .contact .row .map {
                -webkit-box-flex: 1;
                -ms-flex: 1 1 42rem;
                flex: 1 1 42rem;
                width: 100%;
                padding: 2rem;
                border: 0.1rem solid rgba(0, 0, 0, 0.3);
                border-radius: .5rem;
                -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            }

        .blogs .slide {
            border: 0.1rem solid rgba(0, 0, 0, 0.3);
            border-radius: .5rem;
            -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

            .blogs .slide .image {
                height: 25rem;
                width: 100%;
                overflow: hidden;
            }

                .blogs .slide .image img {
                    height: 100%;
                    width: 100%;
                    -o-object-fit: cover;
                    object-fit: cover;
                }

            .blogs .slide:hover .image img {
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }

            .blogs .slide .content {
                padding: 2rem;
            }

                .blogs .slide .content h3 {
                    font-size: 2.2rem;
                    color: #130f40;
                }

                .blogs .slide .content p {
                    font-size: 1.4rem;
                    color: #666;
                    line-height: 2;
                    padding: 1rem 0;
                }

                .blogs .slide .content .icons {
                    margin-top: 2.5rem;
                    padding-top: 2rem;
                    border-top: 0.1rem solid rgba(0, 0, 0, 0.3);
                    display: -webkit-box;
                    display: -ms-flexbox;
                    display: flex;
                    -webkit-box-align: center;
                    -ms-flex-align: center;
                    align-items: center;
                    -webkit-box-pack: justify;
                    -ms-flex-pack: justify;
                    justify-content: space-between;
                }

                    .blogs .slide .content .icons a {
                        font-size: 1.4rem;
                        color: #666;
                    }

                        .blogs .slide .content .icons a i {
                            padding-right: .5rem;
                            color: #eb4d4b;
                        }

                        .blogs .slide .content .icons a:hover {
                            color: #eb4d4b;
                        }

        .footer {
            background: #f9f9f9;
        }

            .footer .box-container {
                display: -ms-grid;
                display: grid;
                -ms-grid-columns: (minmax(25rem, 1fr))[auto-fit];
                grid-template-columns: repeat(auto-fit, minmax(25rem, 1fr));
                gap: 1.5rem;
            }

                .footer .box-container .box h3 {
                    font-size: 2.2rem;
                    color: #130f40;
                    padding: 1rem 0;
                }

                .footer .box-container .box p {
                    font-size: 1.5rem;
                    color: #666;
                    padding: 1rem 0;
                    line-height: 2;
                }

                .footer .box-container .box a {
                    display: block;
                    font-size: 1.4rem;
                    color: #666;
                    padding: 1rem 0;
                }

                    .footer .box-container .box a i {
                        padding-right: .5rem;
                        color: #eb4d4b;
                    }

                    .footer .box-container .box a:hover {
                        color: #eb4d4b;
                    }

                        .footer .box-container .box a:hover i {
                            padding-right: 2rem;
                        }

            .footer .share {
                padding-top: 2rem;
                text-align: center;
            }

                .footer .share a {
                    font-size: 2rem;
                    height: 5rem;
                    width: 5rem;
                    line-height: 5rem;
                    border-radius: 50%;
                    background: #130f40;
                    color: #fff;
                    margin: .3rem;
                }

                    .footer .share a:hover {
                        background: #eb4d4b;
                        -webkit-transform: rotate(360deg);
                        transform: rotate(360deg);
                    }

            .footer .credit {
                margin-top: 2.5rem;
                padding: 1rem;
                padding-top: 2rem;
                border-top: 0.1rem solid rgba(0, 0, 0, 0.3);
                text-align: center;
                color: #666;
                font-size: 2rem;
            }

                .footer .credit span {
                    color: #eb4d4b;
                }

        @media (max-width: 991px) {
            html {
                font-size: 55%;
            }

            .header {
                padding: 2rem;
            }

            section {
                padding: 2rem;
            }
        }

        @media (max-width: 768px) {
            #menu-btn {
                display: inline-block;
            }

            .header .navbar {
                position: absolute;
                top: 99%;
                left: 0;
                right: 0;
                background: #fff;
                border-bottom: 0.1rem solid rgba(0, 0, 0, 0.3);
                -webkit-clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
                clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
            }

                .header .navbar.active {
                    -webkit-clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
                    clip-path: polygon(0 0, 100% 0, 100% 100%, 0% 100%);
                }

                .header .navbar a {
                    font-size: 2rem;
                    margin: 2rem;
                    display: block;
                }

            .header .search-form {
                width: 100%;
                top: 100%;
                border-radius: 0;
            }

                .header .search-form.active {
                    right: 0;
                }

            .home .home-slider .slide {
                padding-left: 2rem;
            }
        }

        @media (max-width: 450px) {
            html {
                font-size: 50%;
            }

            .heading {
                font-size: 3rem;
            }

            .banner-container .banner .content {
                right: 2rem;
            }

                .banner-container .banner .content h3 {
                    font-size: 2rem;
                }

            .products .box-container .box {
                width: 100%;
            }

            .deal .image img {
                width: 100%;
            }

            .deal .content {
                padding-top: 2rem;
                text-align: center;
            }

            .featured .swiper-button-next,
            .featured .swiper-button-prev {
                display: none;
            }

            .blogs .swiper-button-next,
            .blogs .swiper-button-prev {
                display: none;
            }

            .contact .row form .inputBox input {
                width: 100%;
            }
        }
        /*# sourceMappingURL=style.css.map */
    </style>
</body>
</html>
