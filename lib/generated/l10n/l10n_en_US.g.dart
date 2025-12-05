///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'l10n.dart';

// Path: <root>
typedef TranslationsEnUs = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.enUs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en-US>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEnUs app = TranslationsAppEnUs._(_root);
	late final TranslationsCommonEnUs common = TranslationsCommonEnUs._(_root);
	late final TranslationsPhotoPreviewEnUs photoPreview = TranslationsPhotoPreviewEnUs._(_root);
	late final TranslationsSystemPermissionEnUs SystemPermission = TranslationsSystemPermissionEnUs._(_root);
	late final TranslationsPhotoCropEnUs photoCrop = TranslationsPhotoCropEnUs._(_root);
	late final TranslationsPhotoPreviewMultiEnUs photoPreviewMulti = TranslationsPhotoPreviewMultiEnUs._(_root);
	late final TranslationsVideoPreviewEnUs videoPreview = TranslationsVideoPreviewEnUs._(_root);
}

// Path: app
class TranslationsAppEnUs {
	TranslationsAppEnUs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en-US: 'Fspace'
	String get name => 'Fspace';
}

// Path: common
class TranslationsCommonEnUs {
	TranslationsCommonEnUs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en-US: 'No data'
	String get noData => 'No data';

	/// en-US: 'No data yet, click Refresh'
	String get noDataReload => 'No data yet, click Refresh';

	/// en-US: 'Load failed'
	String get loadFail => 'Load failed';

	/// en-US: 'Load failed, click to try again'
	String get loadFailRetry => 'Load failed, click to try again';

	/// en-US: 'Try again'
	String get tryAgain => 'Try again';

	/// en-US: 'Cancel'
	String get cancel => 'Cancel';

	/// en-US: 'Confirm'
	String get confirm => 'Confirm';

	/// en-US: 'Done'
	String get done => 'Done';

	/// en-US: 'Refresh failed'
	String get refreshFaild => 'Refresh failed';

	/// en-US: 'The current network is slow, please try again'
	String get httpNetError => 'The current network is slow, please try again';

	/// en-US: 'The server is out of service'
	String get httpServiceError => 'The server is out of service';

	/// en-US: 'Something went wrong~'
	String get httpUnknownError => 'Something went wrong~';

	/// en-US: 'This device does not support in-app purchase payment.'
	String get applyPayUnavailable => 'This device does not support in-app purchase payment.';

	/// en-US: 'No product information was found.'
	String get applePayNotFondProduct => 'No product information was found.';

	/// en-US: 'Payment canceled'
	String get applePayCancel => 'Payment canceled';

	/// en-US: 'Payment failed'
	String get applePayPayFail => 'Payment failed';
}

// Path: photoPreview
class TranslationsPhotoPreviewEnUs {
	TranslationsPhotoPreviewEnUs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en-US: 'All photos'
	String get allPhoto => 'All photos';

	/// en-US: 'Add more\naccessible photos'
	String get addMore => 'Add more\naccessible photos';

	/// en-US: 'Recently used'
	String get recentlyUse => 'Recently used';

	/// en-US: 'Fspace can only access some photos. If you need to modify the photo access range, please go to settings.'
	String get photoPermissionLimitTitle => '${_root.app.name} can only access some photos. If you need to modify the photo access range, please go to settings.';

	/// en-US: 'Go to settings'
	String get photoPermissionLimitSet => 'Go to settings';
}

// Path: SystemPermission
class TranslationsSystemPermissionEnUs {
	TranslationsSystemPermissionEnUs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en-US: 'Grant photo album permissions to experience AI gameplay'
	String get title => 'Grant photo album permissions to experience AI gameplay';

	/// en-US: 'Need to access all photos, please go to the settings page to change permissions'
	String get description => 'Need to access all photos, please go to the settings page to change permissions';

	/// en-US: 'Go to authorization'
	String get authorization => 'Go to authorization';
}

// Path: photoCrop
class TranslationsPhotoCropEnUs {
	TranslationsPhotoCropEnUs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en-US: 'The picture supports a fixed aspect ratio. Please place your face within the frame'
	String get cropTips => 'The picture supports a fixed aspect ratio. Please place your face within the frame';

	/// en-US: 'The image is being processed, please wait.'
	String get cropLoad => 'The image is being processed, please wait.';
}

// Path: photoPreviewMulti
class TranslationsPhotoPreviewMultiEnUs {
	TranslationsPhotoPreviewMultiEnUs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en-US: 'All photos'
	String get allPhoto => 'All photos';

	/// en-US: 'Select ${count} photos'
	String selectTitle1({required Object count}) => 'Select ${count} photos';

	/// en-US: 'Select ${minCount}-${maxCount} photos (Selected ${count})'
	String selectTitle2({required Object minCount, required Object maxCount, required Object count}) => 'Select ${minCount}-${maxCount} photos (Selected ${count})';

	/// en-US: 'Next'
	String get next => 'Next';

	/// en-US: 'Add more\naccessible photos'
	String get addMore => 'Add more\naccessible photos';

	/// en-US: 'Up to ${maxSelectCount} image can be uploaded'
	String selectTip({required Object maxSelectCount}) => 'Up to ${maxSelectCount} image can be uploaded';
}

// Path: videoPreview
class TranslationsVideoPreviewEnUs {
	TranslationsVideoPreviewEnUs._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en-US: 'All videos'
	String get allVideo => 'All videos';

	/// en-US: 'Add more\naccessible videos'
	String get addMore => 'Add more\naccessible videos';

	/// en-US: 'Select ${count} videos to extract audio'
	String selectTitle1({required Object count}) => 'Select ${count} videos to extract audio';

	/// en-US: 'Select ${minCount}-${maxCount} videos to extract audio (Selected ${count})'
	String selectTitle2({required Object minCount, required Object maxCount, required Object count}) => 'Select ${minCount}-${maxCount} videos to extract audio (Selected ${count})';

	/// en-US: 'Up to ${maxSelectCount} video can be uploaded'
	String selectTip({required Object maxSelectCount}) => 'Up to ${maxSelectCount} video can be uploaded';

	/// en-US: 'Next'
	String get next => 'Next';
}

/// The flat map containing all translations for locale <en-US>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Fspace',
			'common.noData' => 'No data',
			'common.noDataReload' => 'No data yet, click Refresh',
			'common.loadFail' => 'Load failed',
			'common.loadFailRetry' => 'Load failed, click to try again',
			'common.tryAgain' => 'Try again',
			'common.cancel' => 'Cancel',
			'common.confirm' => 'Confirm',
			'common.done' => 'Done',
			'common.refreshFaild' => 'Refresh failed',
			'common.httpNetError' => 'The current network is slow, please try again',
			'common.httpServiceError' => 'The server is out of service',
			'common.httpUnknownError' => 'Something went wrong~',
			'common.applyPayUnavailable' => 'This device does not support in-app purchase payment.',
			'common.applePayNotFondProduct' => 'No product information was found.',
			'common.applePayCancel' => 'Payment canceled',
			'common.applePayPayFail' => 'Payment failed',
			'photoPreview.allPhoto' => 'All photos',
			'photoPreview.addMore' => 'Add more\naccessible photos',
			'photoPreview.recentlyUse' => 'Recently used',
			'photoPreview.photoPermissionLimitTitle' => '${_root.app.name} can only access some photos. If you need to modify the photo access range, please go to settings.',
			'photoPreview.photoPermissionLimitSet' => 'Go to settings',
			'SystemPermission.title' => 'Grant photo album permissions to experience AI gameplay',
			'SystemPermission.description' => 'Need to access all photos, please go to the settings page to change permissions',
			'SystemPermission.authorization' => 'Go to authorization',
			'photoCrop.cropTips' => 'The picture supports a fixed aspect ratio. Please place your face within the frame',
			'photoCrop.cropLoad' => 'The image is being processed, please wait.',
			'photoPreviewMulti.allPhoto' => 'All photos',
			'photoPreviewMulti.selectTitle1' => ({required Object count}) => 'Select ${count} photos',
			'photoPreviewMulti.selectTitle2' => ({required Object minCount, required Object maxCount, required Object count}) => 'Select ${minCount}-${maxCount} photos (Selected ${count})',
			'photoPreviewMulti.next' => 'Next',
			'photoPreviewMulti.addMore' => 'Add more\naccessible photos',
			'photoPreviewMulti.selectTip' => ({required Object maxSelectCount}) => 'Up to ${maxSelectCount} image can be uploaded',
			'videoPreview.allVideo' => 'All videos',
			'videoPreview.addMore' => 'Add more\naccessible videos',
			'videoPreview.selectTitle1' => ({required Object count}) => 'Select ${count} videos to extract audio',
			'videoPreview.selectTitle2' => ({required Object minCount, required Object maxCount, required Object count}) => 'Select ${minCount}-${maxCount} videos to extract audio (Selected ${count})',
			'videoPreview.selectTip' => ({required Object maxSelectCount}) => 'Up to ${maxSelectCount} video can be uploaded',
			'videoPreview.next' => 'Next',
			_ => null,
		};
	}
}
