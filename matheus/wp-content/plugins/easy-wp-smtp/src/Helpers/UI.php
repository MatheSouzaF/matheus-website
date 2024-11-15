<?php

namespace EasyWPSMTP\Helpers;

/**
 * Admin interface helpers.
 *
 * @since {VERSION}
 */
class UI {

	/**
	 * Output an obfuscated password field.
	 *
	 * @since {VERSION}
	 *
	 * @param array $args Field attributes.
	 *
	 * @return void
	 */
	public static function hidden_password_field( $args ) { // phpcs:ignore Generic.Metrics.CyclomaticComplexity.TooHigh

		$args = wp_parse_args(
			$args,
			[
				'name'       => '',
				'id'         => '',
				'value'      => '',
				'clear_text' => esc_html__( 'Remove', 'easy-wp-smtp' ),
			]
		);

		$value = str_repeat( '*', strlen( $args['value'] ) );

		// phpcs:disable Squiz.ControlStructures.ControlSignature.NewlineAfterOpenBrace
		?>

		<div class="easy-wp-smtp-input-btn-row">

			<input type="password"
			       spellcheck="false"
			       autocomplete="new-password"
			       <?php if ( ! empty( $value ) ) : ?>disabled<?php endif; ?>
			       <?php if ( ! empty( $args['name'] && empty( $value ) ) ) : ?>name="<?php echo esc_attr( $args['name'] ); ?>"<?php endif; ?>
			       <?php if ( ! empty( $args['name'] ) ) : ?>data-name="<?php echo esc_attr( $args['name'] ); ?>"<?php endif; ?>
			       <?php if ( ! empty( $args['id'] ) ) : ?>id="<?php echo esc_attr( $args['id'] ); ?>"<?php endif; ?>
			       <?php if ( ! empty( $value ) ) : ?>value="<?php echo esc_attr( $value ); ?>"<?php endif; ?>/>

			<?php if ( ! empty( $value ) ) : ?>

				<button type="button"
				        class="easy-wp-smtp-btn easy-wp-smtp-btn--tertiary"
				        data-clear-field="<?php echo esc_attr( $args['id'] ); ?>"><?php echo esc_html( $args['clear_text'] ); ?></button>

			<?php endif; ?>
		</div>
		<?php
		// phpcs:enable Squiz.ControlStructures.ControlSignature.NewlineAfterOpenBrace
	}
}
