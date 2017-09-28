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
  
  /// This `R.file` struct is generated, and contains static references to 2 files.
  struct file {
    /// Resource file `.swiftlint.yml`.
    static let swiftlintYml = Rswift.FileResource(bundle: R.hostingBundle, name: ".swiftlint", pathExtension: "yml")
    /// Resource file `Settings.bundle`.
    static let settingsBundle = Rswift.FileResource(bundle: R.hostingBundle, name: "Settings", pathExtension: "bundle")
    
    /// `bundle.url(forResource: ".swiftlint", withExtension: "yml")`
    static func swiftlintYml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.swiftlintYml
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Settings", withExtension: "bundle")`
    static func settingsBundle(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.settingsBundle
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 23 images.
  struct image {
    /// Image `Alabama_bw`.
    static let alabama_bw = Rswift.ImageResource(bundle: R.hostingBundle, name: "Alabama_bw")
    /// Image `Alabama`.
    static let alabama = Rswift.ImageResource(bundle: R.hostingBundle, name: "Alabama")
    /// Image `Alaska`.
    static let alaska = Rswift.ImageResource(bundle: R.hostingBundle, name: "Alaska")
    /// Image `Arizona`.
    static let arizona = Rswift.ImageResource(bundle: R.hostingBundle, name: "Arizona")
    /// Image `bg`.
    static let bg = Rswift.ImageResource(bundle: R.hostingBundle, name: "bg")
    /// Image `centerButton`.
    static let centerButton = Rswift.ImageResource(bundle: R.hostingBundle, name: "centerButton")
    /// Image `green_tab`.
    static let green_tab = Rswift.ImageResource(bundle: R.hostingBundle, name: "green_tab")
    /// Image `icon0`.
    static let icon0 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon0")
    /// Image `icon1`.
    static let icon1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon1")
    /// Image `icon2`.
    static let icon2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon2")
    /// Image `icon3`.
    static let icon3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon3")
    /// Image `icon4`.
    static let icon4 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon4")
    /// Image `icon5`.
    static let icon5 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon5")
    /// Image `icon6`.
    static let icon6 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon6")
    /// Image `icon7`.
    static let icon7 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon7")
    /// Image `icons8-Car-48`.
    static let icons8Car48 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icons8-Car-48")
    /// Image `icons8-Car-49`.
    static let icons8Car49 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icons8-Car-49")
    /// Image `knob`.
    static let knob = Rswift.ImageResource(bundle: R.hostingBundle, name: "knob")
    /// Image `mask copy`.
    static let maskCopy = Rswift.ImageResource(bundle: R.hostingBundle, name: "mask copy")
    /// Image `mask`.
    static let mask = Rswift.ImageResource(bundle: R.hostingBundle, name: "mask")
    /// Image `red_tab`.
    static let red_tab = Rswift.ImageResource(bundle: R.hostingBundle, name: "red_tab")
    /// Image `segment`.
    static let segment = Rswift.ImageResource(bundle: R.hostingBundle, name: "segment")
    /// Image `yellow_tab`.
    static let yellow_tab = Rswift.ImageResource(bundle: R.hostingBundle, name: "yellow_tab")
    
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
    
    /// `UIImage(named: "bg", bundle: ..., traitCollection: ...)`
    static func bg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.bg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "centerButton", bundle: ..., traitCollection: ...)`
    static func centerButton(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.centerButton, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "green_tab", bundle: ..., traitCollection: ...)`
    static func green_tab(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.green_tab, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon0", bundle: ..., traitCollection: ...)`
    static func icon0(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon0, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon1", bundle: ..., traitCollection: ...)`
    static func icon1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon1, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon2", bundle: ..., traitCollection: ...)`
    static func icon2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon2, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon3", bundle: ..., traitCollection: ...)`
    static func icon3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon3, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon4", bundle: ..., traitCollection: ...)`
    static func icon4(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon4, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon5", bundle: ..., traitCollection: ...)`
    static func icon5(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon5, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon6", bundle: ..., traitCollection: ...)`
    static func icon6(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon6, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icon7", bundle: ..., traitCollection: ...)`
    static func icon7(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon7, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icons8-Car-48", bundle: ..., traitCollection: ...)`
    static func icons8Car48(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icons8Car48, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icons8-Car-49", bundle: ..., traitCollection: ...)`
    static func icons8Car49(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icons8Car49, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "knob", bundle: ..., traitCollection: ...)`
    static func knob(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.knob, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "mask copy", bundle: ..., traitCollection: ...)`
    static func maskCopy(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.maskCopy, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "mask", bundle: ..., traitCollection: ...)`
    static func mask(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.mask, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "red_tab", bundle: ..., traitCollection: ...)`
    static func red_tab(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.red_tab, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "segment", bundle: ..., traitCollection: ...)`
    static func segment(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.segment, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "yellow_tab", bundle: ..., traitCollection: ...)`
    static func yellow_tab(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.yellow_tab, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    /// Nib `LoadTripCell`.
    static let loadTripCell = _R.nib._LoadTripCell()
    /// Nib `LoadTripTableHeaderView`.
    static let loadTripTableHeaderView = _R.nib._LoadTripTableHeaderView()
    
    /// `UINib(name: "LoadTripCell", in: bundle)`
    static func loadTripCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.loadTripCell)
    }
    
    /// `UINib(name: "LoadTripTableHeaderView", in: bundle)`
    static func loadTripTableHeaderView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.loadTripTableHeaderView)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `PlatesTableViewCell`.
    static let platesTableViewCell: Rswift.ReuseIdentifier<PlatesTableViewCell> = Rswift.ReuseIdentifier(identifier: "PlatesTableViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      // There are no resources to validate
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R {
  struct nib {
    struct _LoadTripCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "LoadTripCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> LoadTripCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? LoadTripCell
      }
      
      fileprivate init() {}
    }
    
    struct _LoadTripTableHeaderView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "LoadTripTableHeaderView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> LoadTripTableHeaderView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? LoadTripTableHeaderView
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard {
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}