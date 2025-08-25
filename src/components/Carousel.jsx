import "swiper/css";
import { Swiper, SwiperSlide } from "swiper/react";

export default function Carousel() {
  return (
    <div className="mb-40" id="carousel">
      <h2 className="mb-20 text-3xl font-bold text-center titulo-carousel text-zinc-300">
        Projetos
      </h2>
      <Swiper
        spaceBetween={20} // Espaço entre os slides
        slidesPerGroup={1} // Quantos mudam por vez
        loop={true} // Loop infinito
        breakpoints={{
          0: {
            slidesPerView: 1.2,
          },
          1024: {
            slidesPerView: 3,
          },
        }}
      >
        <SwiperSlide className="cursor-pointer t-06">
          <div className="t-06 bg-4 flex h-[500px] items-center justify-center rounded-xl text-xl text-white">
            Box 1
          </div>
        </SwiperSlide>
        <SwiperSlide className="cursor-pointer t-06">
          <div className="t-06 bg-4 flex h-[500px] items-center justify-center rounded-xl text-xl text-white">
            Box 2
          </div>
        </SwiperSlide>
        <SwiperSlide className="cursor-pointer t-06">
          <div className="t-06 bg-4 flex h-[500px] items-center justify-center rounded-xl text-xl text-white">
            Box 3
          </div>
        </SwiperSlide>
        <SwiperSlide className="cursor-pointer t-06">
          <div className="t-06 bg-4 flex h-[500px] items-center justify-center rounded-xl text-xl text-white">
            Box 4
          </div>
        </SwiperSlide>
        <SwiperSlide className="cursor-pointer t-06">
          <div className="t-06 bg-4 flex h-[500px] items-center justify-center rounded-xl text-xl text-white">
            Box 5
          </div>
        </SwiperSlide>
        <SwiperSlide className="cursor-pointer t-06">
          <div className="t-06 bg-4 flex h-[500px] items-center justify-center rounded-xl text-xl text-white">
            Box 6
          </div>
        </SwiperSlide>
      </Swiper>
    </div>
  );
}
