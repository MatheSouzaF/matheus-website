(function($) {

    'use strict';

    if (typeof _mff == 'undefined' || _mff === null) {
        return;
    }

    $.fn.mff_mask = $.fn.mask;

    jQuery(document).ready(function($) {
        $('span.start, input.start').mff_mask('00/0000');
        $('span.date, input.date').mff_mask('00/00/0000');
        $('span.time, input.time').mff_mask('00:00:00');
        $('span.time2, input.time2').mff_mask('00:00');
        $('input.date_time').mff_mask('00/00/0000 00:00:00');
        $('input.date_time2').mff_mask('00/00/0000 00:00');
        $('input.cep').mff_mask('00000-000');
        $('input.zip').mff_mask('00000');
        $('input.phone, input[name="phonebr"]').mff_mask(PhoneMaskBehavior, nonoOptions);
        $('input.phone_us').mff_mask('(000) 000-0000');
        $('input.taxid').mff_mask('00-0000000');
        $('input.ssn').mff_mask('000-00-0000');
        $('input.mixed').mff_mask('AAA 000-S0S');
        $('input.cpf').mff_mask('000.000.000-00', { reverse: true });
        $('input.cnpj').mff_mask('00.000.000/0000-00', { reverse: true });
        $('input.money').mff_mask('000.000.000.000.000,00', { reverse: true });
        $('input.money2').mff_mask('#.##0,00', { reverse: true });
        $('input.money3').mff_mask('#,##0.00', { reverse: true });
        $('input.money4').mff_mask('000,000,000,000,000.00', { reverse: true });
        $('input.money5').mff_mask('#.##0', { reverse: true });
        $('input.money6').mff_mask('#,##0', { reverse: true });
        $('input.ip_address').mff_mask('099.099.099.099');
        $('input.percent').mff_mask('##0,00%', { reverse: true });
        $('input.percent2').mff_mask('##0.00%', { reverse: true });
        $('input.percent3').mff_mask('990,0%', { reverse: true });
        $('input.percent4').mff_mask('990.0%', { reverse: true });
        $('input.percent5').mff_mask('#,##0%', { reverse: true });
        $('input.percent6').mff_mask('#.##0%', { reverse: true });
    });

    var PhoneMaskBehavior = function(val) {
            return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
        },
        nonoOptions = {
            onKeyPress: function(val, e, field, options) {
                field.mff_mask(PhoneMaskBehavior.apply({}, arguments), options);
            }
        };

})(jQuery);