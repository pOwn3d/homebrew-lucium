cask "lucium" do
  arch arm: "arm64"

  version "1.0.1"
  sha256 "3929cb2932efa16d3da30be8bc911ada1ea1640a5c9fe269c6e1f903a897b234"

  url "https://lucium.app/updates/darwin-arm64/Lucium-#{version}-#{arch}.dmg"
  name "Lucium"
  desc "Free web browser with a vertical sidebar and one space for each part of your life"
  homepage "https://lucium.app/"

  livecheck do
    url "https://lucium.app/updates/darwin-arm64/feed.json"
    strategy :json do |json|
      json["currentRelease"]
    end
  end

  auto_updates true
  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Lucium.app"

  zap trash: [
    "~/Library/Application Support/Lucium",
    "~/Library/Preferences/app.lucium.browser.plist",
    "~/Library/Saved Application State/app.lucium.browser.savedState",
  ]
end
