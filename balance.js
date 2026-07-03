// AUTO-GENERATED from balance.csv (build-balance.ps1) - DO NOT EDIT BY HAND.
// Edit balance.csv, then run build-balance.bat or publish.bat.
window.BALANCE = {
    "game":  {
                 "dawnTime":  900,
                 "dawnBonus":  20,
                 "bossInterval":  180,
                 "bossHp":  800,
                 "bossDmg":  42,
                 "bossXp":  40,
                 "hordeInterval":  85,
                 "hordeIntervalDawn":  60,
                 "biteCd":  0.8,
                 "poisonTickCd":  0.5
             },
    "curve":  {
                  "hpPerMin":  1.2,
                  "hpPerMinDawn":  1.3,
                  "dmgPerMin":  1.1,
                  "dmgPerMinDawn":  1.2,
                  "dmgMax":  10,
                  "spdPreDawn":  0.25,
                  "spdPerMinDawn":  0.09,
                  "spdMax":  10,
                  "spawnBase":  1.05,
                  "spawnDecay":  0.93,
                  "spawnDecayDawn":  0.85,
                  "spawnMin":  0.12,
                  "spawnCountDiv":  120,
                  "maxEnemies":  420
              },
    "enemy":  {
                  "walker":  {
                                 "hp":  22,
                                 "speed":  42,
                                 "dmg":  12,
                                 "xp":  1,
                                 "from":  0,
                                 "w":  10
                             },
                  "runner":  {
                                 "hp":  13,
                                 "speed":  115,
                                 "dmg":  9,
                                 "xp":  2,
                                 "from":  60,
                                 "w":  4
                             },
                  "bloater":  {
                                  "hp":  65,
                                  "speed":  30,
                                  "dmg":  18,
                                  "xp":  3,
                                  "from":  180,
                                  "w":  1.5
                              },
                  "brute":  {
                                "hp":  170,
                                "speed":  36,
                                "dmg":  30,
                                "xp":  6,
                                "from":  300,
                                "w":  1.5
                            },
                  "crawler":  {
                                  "hp":  8,
                                  "speed":  155,
                                  "dmg":  7,
                                  "xp":  1,
                                  "from":  420,
                                  "w":  3
                              }
              },
    "drop":  {
                 "medChance":  0.006,
                 "magnetChance":  0.0017,
                 "bossCoin":  10,
                 "medHeal":  35
             },
    "player":  {
                   "hp":  100,
                   "speed":  150,
                   "magnet":  70,
                   "levelHeal":  5
               },
    "progress":  {
                     "xpFirst":  8,
                     "xpBase":  6,
                     "xpPerLevel":  9,
                     "metaCostGrowth":  2
                 },
    "meta":  {
                 "damage":  {
                                "cost":  50,
                                "max":  5,
                                "step":  0.1
                            },
                 "hp":  {
                            "cost":  50,
                            "max":  5,
                            "step":  15
                        },
                 "armor":  {
                               "cost":  50,
                               "max":  4,
                               "step":  0.05
                           },
                 "regen":  {
                               "cost":  50,
                               "max":  3,
                               "step":  0.3
                           },
                 "speed":  {
                               "cost":  50,
                               "max":  5,
                               "step":  0.04
                           },
                 "magnet":  {
                                "cost":  100,
                                "max":  3,
                                "step":  0
                            },
                 "greed":  {
                               "cost":  0,
                               "max":  0,
                               "step":  0
                           }
             },
    "passive":  {
                    "speed":  0.08,
                    "maxhp":  25,
                    "magnet":  0.4,
                    "power":  0.12,
                    "regen":  0.8
                },
    "weapon":  {
                   "pistol":  {
                                  "dmgBase":  11,
                                  "dmgPer":  7,
                                  "cdBase":  0.85,
                                  "cdPer":  0.1,
                                  "cdMin":  0.22
                              },
                   "shotgun":  {
                                   "dmgBase":  7,
                                   "dmgPer":  4,
                                   "cdBase":  1.7,
                                   "cdPer":  0.12,
                                   "cdMin":  0.7,
                                   "pelletsBase":  4,
                                   "pelletsPer":  2
                               },
                   "molotov":  {
                                   "cdBase":  3.6,
                                   "cdPer":  0.45,
                                   "cdMin":  1.2,
                                   "dpsBase":  14,
                                   "dpsPer":  10,
                                   "radBase":  58,
                                   "radPer":  14
                               },
                   "wire":  {
                                "tick":  0.4,
                                "dmgBase":  10,
                                "dmgPer":  8,
                                "radBase":  70,
                                "radPer":  16
                            },
                   "saw":  {
                               "dmgBase":  16,
                               "dmgPer":  10,
                               "cd":  0.35,
                               "rad":  78
                           }
               }
};
