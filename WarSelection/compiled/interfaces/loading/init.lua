hints = {
  localize("<*hint0>"),
  localize("<*hint1>"),
  localize("<*hint2>"),
  localize("<*hint3>"),
  localize("<*hint4>"),
  localize("<*hint5>"),
  localize("<*hint6>"),
  localize("<*hint7>"),
  localize("<*hint8>"),
  localize("<*hint9>"),
  localize("<*hint10>"),
  localize("<*hint11>"),
  localize("<*hint12>"),
  localize("<*hint13>")
}
bigPictures = {
  4,
  5,
  6,
  9,
  10
}

function getRandomHint()
  return hints[math.random(#hints)]
end

math.randomseed(os.time())
