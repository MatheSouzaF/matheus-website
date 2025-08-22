import { useState } from "react";
import "./App.css";
import { Banner } from "./components/Banner";
import Carousel from "./components/Carousel";
import { Footer } from "./components/Footer";
import Header from "./components/Header";

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="wrapper">
      <Header />
      <Banner />
      <Carousel />
      <Footer />
    </div>
  );
}

export default App;
