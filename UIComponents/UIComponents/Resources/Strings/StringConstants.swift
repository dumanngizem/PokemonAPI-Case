// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// Update bundle if you need to change app language
  public static var bundle: Bundle?

  public enum EmptyView {
    /// Try Again
    public static var buttonTitle: String { return L10n.tr("Localizable", "EmptyView.button_title") }
  }

  public enum Home {
    /// HomePage
    public static var title: String { return L10n.tr("Localizable", "Home.title") }
  }

  public enum PokemonDetails {
    public enum Abilites {
      /// Abilities
      public static var titleText: String { return L10n.tr("Localizable", "PokemonDetails.Abilites.title_text") }
    }
  }

  public enum Splash {
    /// POKEMON API CASE
    public static var titleLabelText: String { return L10n.tr("Localizable", "Splash.title_label_text") }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    if let string = LocalizeManager.shared.string(by: key, args: args) {
        return string
    }
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
