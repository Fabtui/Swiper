const jump = () => {
  const navbarLogo = document.querySelectorAll('.navbar-logo');
  if (navbarLogo) {
    navbarLogo.forEach(logo => {
      logo.addEventListener('click', (e) => {
        navbarLogo.classList.add('jump')
      })
    })
  };
}
export { jump }
