import Toastify from 'toastify-js'

class Notify {

  static defaultConfig = {
    style: {
      background: '#1784bd',
      'white-space': 'nowrap',
      padding: '30px'
    },
    newWindow: true,
    close: true,
    duration: 20000,
    gravity: 'bottom',
    position: 'right',
    stopOnFocus: true
  }

  static success(msg) {
    Toastify({
      text: `[SUCESSO] ${msg}`,
      style: {
        background: '#008836',
      },
      ...this.defaultConfig
    }).showToast();
  }

  static error(msg) {
    Toastify({
      text: `[ERRO] ${msg}`,
      style: {
        background: '#db3735',
      },
      ...this.defaultConfig
    }).showToast();
  }

  static warning(msg) {
    Toastify({
      text: `[AVISO] ${msg}`,
      style: {
        background: '#ff8c47',
      },
      ...this.defaultConfig
    }).showToast();
  }

}
export default Notify;