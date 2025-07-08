<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoPulse - Premium Car Services</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&family=Oswald:wght@500;600&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="home.jsp">
            <i class="fas fa-car me-2"></i>
            <span>AutoPulse</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#services">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#about">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#testimonials">Testimonials</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>
                <li class="nav-item ms-lg-3">
                    <a href="login.jsp" class="btn btn-outline-light me-2">Login</a>
                </li>
                <li class="nav-item">
                    <a href="register.jsp" class="btn btn-primary">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <h1 class="hero-title">BEST CAR MAINTENANCE SERVICE</h1>
        <p class="hero-subtitle">At AutoPulse, we are committed to earning your trust by providing the highest quality services at a fair price.</p>
        <div class="d-flex justify-content-center gap-3">
        </div>
    </div>
</section>

<!-- Services Section -->
<section id="services" class="py-5">
    <div class="container">
        <h2 class="text-center section-title">OUR SERVICES</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="service-card card h-100">
                    <div class="card-body text-center p-4">
                        <div class="service-icon">
                            <i class="fas fa-oil-can"></i>
                        </div>
                        <h4 class="card-title">Oil Change</h4>
                        <p class="card-text">Premium oil change services to keep your engine running smoothly and extend its lifespan.</p>
                        <a href="#" class="btn btn-outline-primary">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-card card h-100">
                    <div class="card-body text-center p-4">
                        <div class="service-icon">
                            <i class="fas fa-tools"></i>
                        </div>
                        <h4 class="card-title">Engine Repair</h4>
                        <p class="card-text">Expert diagnosis and repair of all engine issues with genuine parts and warranty.</p>
                        <a href="#" class="btn btn-outline-primary">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-card card h-100">
                    <div class="card-body text-center p-4">
                        <div class="service-icon">
                            <i class="fas fa-car-battery"></i>
                        </div>
                        <h4 class="card-title">Battery Service</h4>
                        <p class="card-text">Complete battery testing, replacement, and maintenance services.</p>
                        <a href="#" class="btn btn-outline-primary">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="service-card card h-100">
                    <div class="card-body text-center p-4">
                        <div class="service-icon">
                            <i class="fas fa-tire"></i>
                        </div>
                        <h4 class="card-title">Tire Services</h4>
                        <p class="card-text">Tire rotation, balancing, alignment, and replacement services for optimal performance.</p>
                        <a href="#" class="btn btn-outline-primary">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-card card h-100">
                    <div class="card-body text-center p-4">
                        <div class="service-icon">
                            <i class="fas fa-broom"></i>
                        </div>
                        <h4 class="card-title">Detailing</h4>
                        <p class="card-text">Professional interior and exterior detailing to restore your vehicle's showroom shine.</p>
                        <a href="#" class="btn btn-outline-primary">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-card card h-100">
                    <div class="card-body text-center p-4">
                        <div class="service-icon">
                            <i class="fas fa-bolt"></i>
                        </div>
                        <h4 class="card-title">Electrical Systems</h4>
                        <p class="card-text">Diagnosis and repair of all electrical system issues with precision tools.</p>
                        <a href="#" class="btn btn-outline-primary">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Why Choose Us Section -->
<section id="about" class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center section-title">WHY CHOOSE AUTOPULSE PRO</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="feature-box">
                    <div class="feature-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <h4>Certified Technicians</h4>
                    <p>Our team consists of factory-trained and certified technicians with years of experience.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <div class="feature-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <h4>Quick Service</h4>
                    <p>We value your time with most services completed within 1-2 hours.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h4>Warranty</h4>
                    <p>All our services come with a minimum 12-month warranty for your peace of mind.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section id="testimonials" class="py-5">
    <div class="container">
        <h2 class="text-center section-title">WHAT OUR CLIENTS SAY</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="testimonial-card">
                    <p>"The best service center I've ever been to. They fixed my car's electrical issues that others couldn't figure out. Highly recommended!"</p>
                    <div class="client-name">Michael Johnson</div>
                    <div class="client-position">Regular Customer</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial-card">
                    <p>"Honest, professional, and reasonably priced. They explained everything clearly and didn't try to upsell unnecessary services."</p>
                    <div class="client-name">Sarah Williams</div>
                    <div class="client-position">First-time Customer</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial-card">
                    <p>"I've been taking my cars here for 5 years. Consistent quality service every time. Their attention to detail is impressive."</p>
                    <div class="client-name">Robert Chen</div>
                    <div class="client-position">Loyal Customer</div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="py-5 bg-light">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0">
                <h2 class="section-title">BOOK AN APPOINTMENT</h2>
                <p class="lead">Schedule your service online and get 10% off your first visit.</p>
                <p>Our team will contact you to confirm your appointment time and provide any additional information you may need.</p>
                <div class="d-flex align-items-center mt-4">
                    <div class="bg-primary text-white rounded-circle p-3 me-3">
                        <i class="fas fa-phone fa-lg"></i>
                    </div>
                    <div>
                        <h5 class="mb-0">Need immediate assistance?</h5>
                        <h4 class="mb-0">011-47-856-12</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="appointment-form">
                    <form>
                        <div class="mb-3">
                            <input type="text" class="form-control" placeholder="Your Name">
                        </div>
                        <div class="mb-3">
                            <input type="email" class="form-control" placeholder="Email Address">
                        </div>
                        <div class="mb-3">
                            <input type="tel" class="form-control" placeholder="Phone Number">
                        </div>
                        <div class="mb-3">
                            <select class="form-select">
                                <option selected>Select Service</option>
                                <option>Oil Change</option>
                                <option>Engine Repair</option>
                                <option>Battery Service</option>
                                <option>Tire Services</option>
                                <option>Detailing</option>
                                <option>Electrical Systems</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <textarea class="form-control" rows="3" placeholder="Additional Notes"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Book Now</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4">
                <h4 class="footer-title"><img src="images/logo.png" alt="CarShine Logo" width="30" height="30" class="me-2">CARSHINE PRO</h4>
                <p>Providing premium automotive services with integrity and excellence. Your trusted partner for all vehicle maintenance and repair needs.</p>
                <div class="social-icons mt-4">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 mb-4">
                <h4 class="footer-title">Services</h4>
                <div class="footer-links">
                    <a href="#services">Oil Change</a>
                    <a href="#services">Engine Repair</a>
                    <a href="#services">Battery Service</a>
                    <a href="#services">Tire Services</a>
                    <a href="#services">Detailing</a>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 mb-4">
                <h4 class="footer-title">Company</h4>
                <div class="footer-links">
                    <a href="#about">About Us</a>
                    <a href="#">Our Team</a>
                    <a href="#">Careers</a>
                    <a href="#testimonials">Testimonials</a>
                    <a href="#">Blog</a>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <h4 class="footer-title">Contact Us</h4>
                <p><i class="fas fa-map-marker-alt me-2"></i> Gamunupura 1st Lane,Kothalawala,Kaduwela.</p>
                <p><i class="fas fa-phone me-2"></i> 011-47-257-78 </p>
                <p><i class="fas fa-envelope me-2"></i> info@carshinepro.com</p>
                <p><i class="fas fa-clock me-2"></i> Mon-Fri: 8AM - 6PM<br>Sat: 9AM - 4PM<br>Sun: Closed</p>
            </div>
        </div>
        <div class="text-center copyright">
            <p>&copy; 2025 AutoPulse Pro. All Rights Reserved.</p>
        </div>
    </div>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>