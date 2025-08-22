export const Footer = () => {
  const year = new Date().getFullYear();

  return (
    <div className="py-4 text-white">
      <div className="container mx-auto text-center">
        <p>&copy; {year} - Todos os direitos reservados</p>
      </div>
    </div>
  );
};
