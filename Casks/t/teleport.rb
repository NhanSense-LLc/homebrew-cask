cask "teleport" do
  version "17.1.6"
  sha256 "654f3e5485d63dc75854688c8ce547565313e02a42efbdbba5255d1ac89c1d2c"

  url "https://cdn.teleport.dev/teleport-#{version}.pkg",
      verified: "cdn.teleport.dev/"
  name "Teleport"
  desc "Modern SSH server for teams managing distributed infrastructure"
  homepage "https://goteleport.com/"

  livecheck do
    url "https://goteleport.com/download/"
    regex(/teleport[._-]v?(\d+(?:\.\d+)+)\.pkg/i)
  end

  conflicts_with cask:    [
                   "tsh",
                   "tsh@13",
                 ],
                 formula: "teleport"

  pkg "teleport-#{version}.pkg"

  uninstall pkgutil: [
              "(.*).com.gravitational.teleport.tctl",
              "(.*).com.gravitational.teleport.tsh",
              "com.gravitational.teleport",
            ],
            delete:  [
              "/usr/local/bin/fdpass-teleport",
              "/usr/local/bin/tbot",
              "/usr/local/bin/tctl",
              "/usr/local/bin/teleport",
              "/usr/local/bin/tsh",
            ]

  zap trash: "~/.tsh"
end
