# Written by scripts/make-cask.mjs of the Lucium repository, from the published disk image and its sum.
# Do not edit by hand: run the script again (docs/community/homebrew.md in that repository).
cask "lucium" do
  version "1.1.2"
  sha256 "bbd5d5a67761eb18e8be5957af6b8a077ab5484d9053dba48966b772e56cbe31"

  url "https://lucium.app/updates/darwin-arm64/Lucium-#{version}-arm64.dmg"
  name "Lucium"
  desc "Web browser with a vertical sidebar"
  homepage "https://lucium.app/"

  livecheck do
    url "https://lucium.app/updates/darwin-arm64/feed.json"
    strategy :json do |json|
      json["currentRelease"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Lucium.app"

  zap trash: [
    "~/Library/Application Support/Lucium",
    "~/Library/Caches/app.lucium.browser",
    "~/Library/Caches/app.lucium.browser.ShipIt",
    "~/Library/HTTPStorages/app.lucium.browser",
    "~/Library/Preferences/app.lucium.browser.plist",
    "~/Library/Preferences/ByHost/app.lucium.browser.ShipIt.*.plist",
    "~/Library/Saved Application State/app.lucium.browser.savedState",
  ]
end
