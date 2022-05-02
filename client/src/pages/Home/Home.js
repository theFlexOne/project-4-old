import "./home.css";
import BarbersSection from "./components/BarberSection/BarbersSection";
import Banner from "./components/Banner/Banner";
import GallerySection from "./components/GallerySection/GallerySection";
import Footer from "../../components/Footer/Footer";

const Home = () => {
  return (
    <div className="home">
      <Banner />
      <BarbersSection />
      <GallerySection />
      {/* <div className="gallery-section"></div> */}
      <div className="services-section"></div>
      <Footer />
    </div>
  );
};

export default Home;