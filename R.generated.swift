//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `.swiftlint.yml`.
    static let swiftlintYml = Rswift.FileResource(bundle: R.hostingBundle, name: ".swiftlint", pathExtension: "yml")
    
    /// `bundle.url(forResource: ".swiftlint", withExtension: "yml")`
    static func swiftlintYml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.swiftlintYml
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 5 images.
  struct image {
    /// Image `Alabama_bw`.
    static let alabama_bw = Rswift.ImageResource(bundle: R.hostingBundle, name: "Alabama_bw")
    /// Image `Alabama`.
    static let alabama = Rswift.ImageResource(bundle: R.hostingBundle, name: "Alabama")
    /// Image `Alaska`.
    static let alaska = Rswift.ImageResource(bundle: R.hostingBundle, name: "Alaska")
    /// Image `Arizona`.
    static let arizona = Rswift.ImageResource(bundle: R.hostingBundle, name: "Arizona")
    /// Image `us_map`.
    static let us_map = Rswift.ImageResource(bundle: R.hostingBundle, name: "us_map")
    
    /// `UIImage(named: "Alabama", bundle: ..., traitCollection: ...)`
    static func alabama(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.alabama, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "Alabama_bw", bundle: ..., traitCollection: ...)`
    static func alabama_bw(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.alabama_bw, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "Alaska", bundle: ..., traitCollection: ...)`
    static func alaska(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.alaska, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "Arizona", bundle: ..., traitCollection: ...)`
    static func arizona(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.arizona, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "us_map", bundle: ..., traitCollection: ...)`
    static func us_map(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.us_map, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 2 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `LoadTripCell`.
    static let loadTripCell: Rswift.ReuseIdentifier<LoadTripCell> = Rswift.ReuseIdentifier(identifier: "LoadTripCell")
    /// Reuse identifier `PlatesTableViewCell`.
    static let platesTableViewCell: Rswift.ReuseIdentifier<PlatesTableViewCell> = Rswift.ReuseIdentifier(identifier: "PlatesTableViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `LoginViewController`, and contains static references to 3 segues.
    struct loginViewController {
      /// Segue identifier `CreateTripViewController`.
      static let createTripViewController: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, LoginViewController, CreateTripViewController> = Rswift.StoryboardSegueIdentifier(identifier: "CreateTripViewController")
      /// Segue identifier `LoadTripViewController`.
      static let loadTripViewController: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, LoginViewController, LoadTripViewController> = Rswift.StoryboardSegueIdentifier(identifier: "LoadTripViewController")
      /// Segue identifier `PlatesViewController`.
      static let platesViewController: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, LoginViewController, PlatesViewController> = Rswift.StoryboardSegueIdentifier(identifier: "PlatesViewController")
      
      /// Optionally returns a typed version of segue `CreateTripViewController`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func createTripViewController(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, LoginViewController, CreateTripViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.loginViewController.createTripViewController, segue: segue)
      }
      
      /// Optionally returns a typed version of segue `LoadTripViewController`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func loadTripViewController(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, LoginViewController, LoadTripViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.loginViewController.loadTripViewController, segue: segue)
      }
      
      /// Optionally returns a typed version of segue `PlatesViewController`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func platesViewController(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, LoginViewController, PlatesViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.loginViewController.platesViewController, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let createTripViewController = StoryboardViewControllerResource<CreateTripViewController>(identifier: "CreateTripViewController")
      let loadTripViewController = StoryboardViewControllerResource<LoadTripViewController>(identifier: "LoadTripViewController")
      let name = "Main"
      let platesViewController = StoryboardViewControllerResource<PlatesViewController>(identifier: "PlatesViewController")
      
      func createTripViewController(_: Void = ()) -> CreateTripViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: createTripViewController)
      }
      
      func loadTripViewController(_: Void = ()) -> LoadTripViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loadTripViewController)
      }
      
      func platesViewController(_: Void = ()) -> PlatesViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: platesViewController)
      }
      
      static func validate() throws {
        if _R.storyboard.main().platesViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'platesViewController' could not be loaded from storyboard 'Main' as 'PlatesViewController'.") }
        if _R.storyboard.main().createTripViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'createTripViewController' could not be loaded from storyboard 'Main' as 'CreateTripViewController'.") }
        if _R.storyboard.main().loadTripViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loadTripViewController' could not be loaded from storyboard 'Main' as 'LoadTripViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}