/* eslint-disable class-methods-use-this */
import scrollTo from 'jquery.scrollto'  // injeta plugin no jQuery ao ser importado

class ScrollTo {

  static settings = {
    offset: -200,
    duration: 700,
    ease: 'easein'
  }

  static initScrollOnPageLoad(){
    console.log('trigger initScrollOnPageLoad')
  }

  static scrollToSection(section){
    console.log(`Scrolling to ${section}`)

    const $section = this.getObject(section)

    // jQuery Plugin call
    $(document).scrollTo($section, this.settings);
  }

  static getObject(section) {

    let $section;

    if ($(section).length > 0) {
      $section = $(section);
    }
    else if ($(`#${section}`).length > 0) {
      $section = $(`#${section}`)
    }
    else if ($(`.${section}`).length > 0) {
      $section = $(`.${section}`)
    }
    else {
      throw new Error(`Section não encontrada ${section}. Não é possível executar scroll`)
    }

    return $section;
  }

}

export {ScrollTo};