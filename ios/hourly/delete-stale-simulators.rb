#!/usr/bin/env ruby

require "json"

content = `xcrun simctl list devices --json`
hash = JSON.parse(content)
devices = hash['devices']

devices.each do |key, value|
  if key.start_with?('iOS')
    # Delete unavailable iOS Simulators
    value.each do |device|
      if device['availability'] != "(available)"
        udid = device['udid']
        `xcrun simctl delete #{udid}`
        puts "deleted #{udid}"
      end
    end
  else
    # Delete watchOS and tvOS simulators
    value.each do |device|
      udid = device['udid']
      `xcrun simctl delete #{udid}`
      puts "deleted #{udid}"
    end
  end
end
