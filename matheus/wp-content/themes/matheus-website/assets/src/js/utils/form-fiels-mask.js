import 'jquery-mask-plugin';

class FormMasks {
  constructor() {
    console.log('Constructed Form Mask');
  }

  init() {
    console.log('Init Form Mask');

    this.setupCellPhoneMask();
  }

  setupCellPhoneMask() {
    const maskBehavior = function (val) {
      return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
    };

    const options = {
      onKeyPress(val, e, field, opt) {
        field.mask(maskBehavior.apply({}, arguments), opt);
      },
    };

    $('#telefone, .cellphone, [name="phone"], [name="cellphone"]').mask(maskBehavior, options);
  }
}

export {FormMasks};
