export const Banner = () => {
  return (
    <div className="flex flex-col justify-center w-full px-4 h-dvh md:px-10">
      <h1 className="t-06 titulo-banner mb-8 max-w-[90%] text-2xl text-zinc-300 md:text-5xl">
        Construindo soluções <p>completas com React & Node.js</p>
      </h1>
      <h2 className="subtitulo-banner t-06 max-w-[100%] text-sm text-zinc-300 md:text-lg lg:max-w-[70%]">
        Sou desenvolvedor Full Stack especializado em React no front-end e
        Node.js no back-end. Transformo ideias em aplicações escaláveis,
        modernas e de alta performance, unindo design, usabilidade e código
        sólido para entregar experiências digitais completas.
      </h2>
    </div>
  );
};
''