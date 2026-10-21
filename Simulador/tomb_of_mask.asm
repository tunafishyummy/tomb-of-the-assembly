; ────┤ Practical Assignment in Computer Organization │ August 2021 ├────
; Gabriel Victor Cardoso Fernandes - 11878296
; Gabriel Alves Kuabara - 11275043
; Lourenço de Salles Roselino - 11796805

; Characters that build the map
; player - z yellow
; normal wall - } blue
; deadly wall - { red
; exit - open gap in the outer wall (dash through it)
; coins - * yellow
; crate - # brown (push it with a dash)
; key - $ silver
; door - = purple
; plate - @ teal
; gate - % blue
; lever - < olive
; bomb - & red
; shield - ^ aqua
; breakable wall - | gray (break it with a bomb)
; toggle wall - ! navy
;
; Keys: WASD dash, B bomb, R or ` restart the level, H or Tab help, Enter start

jmp main

; ────────┤ Menu and map strings and data ├────────
menu_art : string "                                                                                                                                       }}}}}}}}}}                              }        }                              }  }  }  }                              }        }                              }  }}}}  }                              }        }                              }        }                              }}}}}}}}}}                                                                   TOMB OF THE MASK                    GROUP 1 - FINAL PROJECT                                                             ORIGINAL GAME BY                 KUABARA - FERNANDES - ROSELINO                                                           MODIFIED BY                        GARCIA - LAMIO - RAMOS                 RUFINO - SUYO - TIMMALOG                                                         WASD DASH  R/` RESTART   H HELP                                                                                              PRESS ENTER                                                                                                                                                                               "
menu_list_art : string "                                                                                            TOMB OF THE MASK                    GROUP 1 - FINAL PROJECT                                                          GARCIA - LAMIO - RAMOS                 RUFINO - SUYO - TIMMALOG                                                                                                                                              NORMAL MODE                                                                     ENDLESS MODE                                                                    SETTINGS                                                                                                          W/S OR ARROWS   ENTER CONFIRM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   "
blank_screen : string "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                "
settings_art : string "                                                                                                                                        SETTINGS                                                                                                                                            DASH SPEED                                                                      SOUND FX        RESERVED                                                        GAME MUSIC      RESERVED                                                        BACK                                                                                                                  W/S OR ARROWS SELECT   ENTER CHANGE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           "
level1 : string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} }       }           }         }     }}} }}}}} } } } }}}}}}} }}} }}} } }}} } }}}   }   }   }       }   } }   } }   } }}}}} } }}} } }}} } } }}} } } } } } }}} }}}  *} }   }   } } }     } } }   } }   }}} }*} } }}}}} } } }}} } } } } }}} } } }}}   } }   } } }     } }     }     }    }} } } }}} } } }}} }}} }}}}}}}}}}}}}}} }}}   } } } }       }   }             } }}} }}} } }^}}}}}}} } }}}}}}}}} } }}}}} }}} }   } }  *}   }   }       } } }     }}} }}} } }}} } }}} } } } }}} }}} } }}}}}}}*  } }     }     } }#} }             }}}}} } } }}}}} }}}}} }}} } }}}}} } }}} }}  }   } }             } }   }     }{  }}}=}*} } }}}}}}}}}}}}} } } } } } }}} }}}}} } }*}      $}       } }     }   } } }}} } }^}}}}}}} } }}} }}} } }}}}} } } } }}} }   }#    } }        *} }   } } } } }}} }}}}} }}}}} }}} } } }}} } } }}} } } }}}     }    *}     } }   } } }       } }}}}} }}} }}}*} } }}} }}} } } }}}}} } } }}}  *}   }  *} }   } } }   } }{  }   } }}}*}}} }}} }}} }}} } } }}} } } } } }}} }}}      *}        {}*          }       }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}{}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} L1 COINS 000 K 0 B 0 SHIELD -                                                  "
level2 : string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}  }           }      }  }        }  } }}} } }}}}} }}} }}}}}}}*} } }}} } } }}} }}} * }   }   } }       } }   } } }   } }}} }}} } }}} } } }}}}} } }}}}} }}} } } }}} }*  } }   }   }     }     } }   }   }}} } } } } } }}} }}}}} } }}} } } }}} }}}}}   } }       } }   }         }     } }}}}}}} } }}}}} }}} } } }}} }}} } }}} } }}}     }   }       }    *}   } }   }   }}} }}}}}}} } } } }}} }}} } } } }}} }}} }}}         } }*         }  } }     }   }}} }}}}}}}}} } } } } } }}}}} }}} }}} }}}}}  ^} * } } }   } }*}     } } } }   } }}}}} } } } } }}} } }}} }}} } } } } }}} }} *}*} } } }*         *}   } }       } }}} } } } } }}}}} }}}}}}} }}} }}}}}}} } }}} }   }@    }   }     } }   }     } } }}} }}}}} } } } } } }}}}} } }}} }}} } } }}}  ^}   } } } }   }{   #}   } } } }   }}}*} } }}} }}} } }}} }}} }}} } } } }}} }}} }*}   } }     }#  }     }     } }   }}}*} }}} } } }}}}} }}} }}} }}} }}} } }}}}} } }   } }       }     } } }     } } }}}%} } }}} }}}}}}}}} } } } } } }}}}} } }   }                   }     }         }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} L2 COINS 000 K 0 B 0 SHIELD -                                                  "
level3 : string "}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}    *}     }       }=  ^*}          {}}} }}} } } } }}}}} } }}}}} } }}} }}} } }}}  *} } } }       }     }   *     }   }}} } }}} } }}}}}}}}}}}}} }}}}}}}}} } }}}}} } }   } }       }{}  #}  ^    } }   }}} } } }}} } }}}}} } } }}} }}} } } }}} }}} }           }     }   } }   } }     }}} }}}}} }}}}}}} }}} } } } }}} } }}}*} }}}*      }   } * }       }   } }     } }}} } }}} } } } } } }}}}} }}} } }}} } }}}}} }   }   } } }     }       } }   }   }}} } } }}}}} } }}}}} } }}}}}}} } } }}} }}} }         }   } } }*  }      {}     }}} }}}}}}}}} }}} } } }}}*} } }}}}}}} } }}}        *}     } }    }  }   }     } }}}}} }}} } }}} }}} }}}}}}} } } }}} }}} }}}   } *  *}$&<}     }     } }   } }    }} }}} }}} } }}} } }}} }}}}} }}} } }}} }}} }   }    *}   }   }       }   }   }  }} } } } }}}}} }}}}} }}}}}}}}} }}} } }}}}} }   } }     }     }       }   }      }} }}} } } }}}}} }}}}} } }}}}}}} } }}} }}} }   }*}     }       }       } } }   }}} } } }}}}}}} }}}}} }}}}}}} }}} }}} } }}} } #|!                   }           }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} L3 COINS 000 K 0 B 0 SHIELD -                                                  "
level4 : string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}} }}}}}}}}} *       }   }     ^            *}  {}}} }}} } } }*}*} } } }}} }}} }}} } }}} }}}   } } }   }   }   }   }** }       } }}}}} } } }*} }}}}}}} } }}} }}}}}}}}} } }}  =%}     } }#    } } }   }     }     }}}}}}}}}}} } } }}}}} } } } } }}} }}}}} }}}     }   } }  *    } } } } } }       }}} }}} } }}} }}} } } } } }}} } }}} }}}}}}} }   }* *    } }     }   } }   }     }}} } }}}}}}}}} } } }}}}}}} } }}} }}}}} }}} } }     }     }       }         }   }}} } }}} } }}}}} } }}}}}}} }}} }}}}} }}}}}       }#  }     }       }   }   }   }}} }}}}}}}}} }}}}}}} }}}}} }}} } } }}} }}}           }  ^   *}{    }   }       }}} }}}}}}} } } }}}}}}} }}}}} } } }}} } }}}   }    $@<}   }{  }*  }   }   }   } }}}}}}} }}}}} }}} } } }}} } } }}}}} }}} }}}     }  {}*    }       } } }         }}} }}}}} } }}}}}}} }}}}}}}}} }}}}} } }}}}} }   } }       } } }   }         } } }}} } } } }}}}} }}} } } } } }}} }}}}} } }}}*  } } }   }     } } }   } }     } } }}} } } } } } }}} }}}}} } }}} } }}} } } }}}     !   }           }               }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} L4 COINS 000 K 0 B 0 SHIELD -                                                  "
level5 : string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}} }  |}             }       }    *  } }}} } }!} }}}}} }}} } } }}} } }}} } } }}}}}   } }     }     } }     }   } }%=   }}} } } }}}}}}} }}}}} }}} } }}} } }}}}} }}} } }       }   }   }         }   }   }}} } }}}}}}} }}} } }}} } }}} } } } } }}}}} } }         *}}   }       } } } } } }}} } } }}} }}} } }}} } }}}}} } }}} } } }}} }   &<}   } }  {}     }    *    } } }}} }}} } }*} } }}} }}}}} } }}}}}}}}} } }}}*  }  ^   *    }{  } }{  }   }     } }}}}} }}} }}} }}} }}} } }}} } } }}} }}} }}} } }  *    }   }   }     } }*  } }   }}} } } }}} } } }}} }}}}} }}} }}} } } } }}} }   }   } } }  *    }       }     } }}} }}}}}}} } } }}}}} } }*}}}}}}} }}}}} }}}     }   } }* $@^} }           }     }}} } } } } } }}}}} } }}} } }}}}}}} }}}}}}} }     }     }   } }   }   }   } }   }}} }}} }}}}}}} } }}} } } } } }}} } }}} }}}   } }#  }   } }   } } } }           }}} } }}} } }}}}} } }}} } }}} } }}}}}}} }}} }     }     } } } * }  *} }*      } }}} } }}}}}}}}} } }}} }}}}} }}}}} } }}} }}}           }#      }           }     }}}}}}} }}}}}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} L5 COINS 000 K 0 B 0 SHIELD -                                                  "
msg_blank: string " "
msg_clear: string "LEVEL CLEAR!"
msg_trap: string "TRAP! RESTARTING THE LEVEL"
msg_nobomb: string "NO BOMBS LEFT"
msg_nothing: string "NOTHING TO BREAK"
msg_win: string "YOU WIN! PRESS ENTER TO PLAY AGAIN"
msg_shield_bonus: string "SHIELD ALREADY ACTIVE +5 COINS"
msg_game_over: string "GAME OVER"
msg_rooms_cleared: string "ROOMS CLEARED: "
msg_coins_label: string "COINS: "
msg_press_enter: string "PRESS ENTER"
speed_name_slow: string "SLOW  "
speed_name_normal: string "NORMAL"
speed_name_fast: string "FAST  "
msg_sound_reserved: string "SOUND IS RESERVED FOR A FUTURE UPDATE"
msg_blank40: string "                                        "
help_art : string "                                                    TOMB OF THE MASK                          ICON LEGEND                                                          z   PLAYER        MOVE WITH WASD        *   COIN          +1 SCORE              #   CRATE         PUSH WITH A DASH      &   BOMB          PRESS B TO USE IT     ^   SHIELD        BLOCKS ONE TRAP       |   WEAK WALL     BREAK WITH A BOMB     {   TRAP          DEADLY - AVOID IT     $   KEY           OPENS ONE DOOR        =   DOOR          NEEDS A KEY           @   PLATE         OPENS EVERY GATE      %   GATE          CLOSED TILL PLATE     <   LEVER         FLIPS BLUE BLOCKS                                             EXIT   DASH OUT THROUGH THE OPEN GAP         IN THE LEFT OR TOP OUTER WALL                                              CONTROLS   WASD OR ARROWS  DASH                    B BOMB   R/` RESTART                    H/TAB HELP   M = MENU                   ENTER CONFIRM                TIP: DASH RUNS UNTIL A WALL STOPS IT    TIP: PUSH CRATES WITH A DASH                                                     PRESS H, TAB OR ENTER TO RESUME                                                                                     "
map : var #1201		; Working copy of the level, rebuilt on every restart

scroll_buf : var #1201		; Transition buffer used by the level scroll

sprite_colors : var #15
static sprite_colors + #0, #2816	; Coin color
static sprite_colors + #1, #1024	; Normal wall color
static sprite_colors + #2, #2304	; Deadly wall color
static sprite_colors + #3, #3328	; Flag color
static sprite_colors + #4, #0		; no color
static sprite_colors + #5, #256	; Crate color
static sprite_colors + #6, #1792	; Key color
static sprite_colors + #7, #1280	; Door color
static sprite_colors + #8, #1536	; Plate color
static sprite_colors + #9, #3072	; Gate color
static sprite_colors + #10, #768	; Lever color
static sprite_colors + #11, #2304	; Bomb color
static sprite_colors + #12, #3584	; Shield color
static sprite_colors + #13, #2048	; Breakable wall color
static sprite_colors + #14, #1024	; Toggle wall color

; ─────────────────────────────────────────────────────

; ──────────┤ Player related data ├──────────
start_position : var #1
static start_position, #1067	; Player starting position

coin_count: var #1			; keeps how many coins the player has
static coin_count + #0, #0

coin_record: var #1			; coin count when the current level started
static coin_record + #0, #0

key_count: var #1
static key_count + #0, #0

bomb_count: var #1			; bombs in hand
static bomb_count + #0, #0

shield: var #1				; 1 while a shield is active
static shield + #0, #0

flip_list_cur: var #1			; address of the tile list the lever toggles
static flip_list_cur + #0, #0

level_index: var #1
static level_index + #0, #0

game_mode: var #1		; 1 = normal campaign, 2 = endless run
static game_mode + #0, #0

speed_idx: var #1		; 0 slow, 1 normal, 2 fast
static speed_idx + #0, #1

endless_depth: var #1		; room number of the current endless run
static endless_depth + #0, #1
rng_seed: var #1		; 16 bit LCG state
static rng_seed + #0, #44257
gen_tpl: var #1			; template chosen for this room
static gen_tpl + #0, #0
gen_orient: var #1		; bit 0 horizontal mirror, bit 1 vertical
static gen_orient + #0, #0
endless_start: var #1		; transformed start cell of the generated room
static endless_start + #0, #0
endless_exit: var #1		; transformed exit cell of the generated room
static endless_exit + #0, #0
entry_side: var #1		; 0 enters from the left, 1 from the right
static entry_side + #0, #0

room_buf: var #1201		; generated room, copied into the map on entry
empty_flip: var #1		; a flip list with no entries
static empty_flip + #0, #0

start1: var #1
static start1 + #0, #123

start2: var #1
static start2 + #0, #123

start3: var #1
static start3 + #0, #963

start4: var #1
static start4 + #0, #963

start5: var #1
static start5 + #0, #123

exit1: var #1
static exit1 + #0, #600		; (15,0) opening in the left outer wall
exit2: var #1
static exit2 + #0, #1000	; (25,0) opening in the left outer wall
exit3: var #1
static exit3 + #0, #21		; (0,21) opening in the top outer wall
exit4: var #1
static exit4 + #0, #240		; (6,0) opening in the left outer wall
exit5: var #1
static exit5 + #0, #33		; (0,33) opening in the top outer wall

exit_pos: var #1		; exit cell of the level being played
static exit_pos + #0, #0

flip1: var #1
static flip1 + #0, #0

flip2: var #1
static flip2 + #0, #0

flip3: var #2
static flip3 + #0, #1046
static flip3 + #1, #0

flip4: var #2
static flip4 + #0, #1046
static flip4 + #1, #0

flip5: var #2
static flip5 + #0, #85
static flip5 + #1, #0

;Speed variables
speed : var #2
static speed + #0, #40	; vertical speed   (up || down)
static speed + #1, #1	; horizontal speed (left || right)
; ─────────────────────────────────────────────────────

; ────────────┤ Clock delay data ├────────────
; Per-tile dash pacing = loop_count * nops_per_loop NOP rounds.
; The viewport repaints on a 16 ms timer, so one tile per repaint, about
; 17 ms, is the smoothest possible stepping. The optimized simulator build
; (compila.sh and Makefile.win now pass -O2) runs about 215 million
; instructions per second, so loop_count = 180 is about 3.6 million
; instructions per tile which is roughly 17 ms, one rendered frame.
; If the simulator is ever built without optimization (about 35 million
; instructions per second) the dash runs six times slower, use 30 there.
loop_count : var #1
static loop_count, #180

nops_per_loop : var #1
static nops_per_loop, #5000
; ─────────────────────────────────────────────────────

; ══ endless data (generated by tools/make_endless_templates.py) begin ══
template1: string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}   }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}   }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}           }}}}}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}} }}}}}}}}}}}}}                         } }}}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}     }}}}}}}}}}}}}}         }}}}}} }}}}}                 }}}}}}}}}} }}}}}} }}}}}     }}} } }}}}}}}}}}}}}}}} }}}}}} }}}}}}}}} }}} } }}}}}}}}}}}}}}}} }}}}}} }}}}}}}}} }}} } }}}}}}}}}}}}}}}} }}}}}} }}}}}}}}} }}}     }}}}}}}}}}}}}} }}}}}}                   }}}}}}}}}}}}}} }}}}}}}}}}}}}}}} }}}     }}}}}}}}}}}}}} }}}}}}}}}}}}}}}} }}} }}}}}}}}}}}}}}}}}} }}}}}}}}}}}}}}}} }}} }}}}}}}}}}}}}}}}}} }}     }}}}}}}}   }} }}}}}}}}}}}}}}}}}}                      }}}}}}}}}}}}}}}}}}}}}     }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} ROOM 000 000 K 0 B 0 SHIELD -                                                  "
template2: string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}      }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}      }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}      }}}}}}}}}}}}}}}}}}}}}}}}}}                                    }}}}}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}} }}}}}}}      }} }}}}}}}}}}}}}}}}}}}}}}} }}}}}}}      }} }}}}}}}}}}}}}}}}}}}}}}} }}}}}}}                   }}}}}}}}}}}}} }}}}}}}         }}}}}}}}} }}}}}}}}}}}}} }}}}}}}}}} }                }}}}}}}}}}} }}}}}}}}}} }       }}}}}} } }}}}}}}}      }}}}}}}}                                }}}          }} }}}}}}} } }}}}}}         }}}}}}}}}}} }} }}}}}}}     }}}}}}}}}}}}}}}}}}}}}}}} }}             }}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}     }}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}    }}}}}}}}}}}}}}}}}}}}}}}}}}}             }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} ROOM 000 000 K 0 B 0 SHIELD -                                                  "
template3: string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}}}}}}}}}}}}}}}}}                 }}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}}     }}}}}}}}}}}}}}}}}                       }}}}}}}}}}}}}}}}} }}}}} }}}}}}}}}}}}}   }}}}}}}}}}}}}}}}} }}}}} }}}}}}}}}}}}}} }}}}}}}}}}}}}}}}}} }}}     }}}}}}}}}}}} }}}}}}}}}}}}}}}}}} }}}     }}}}}}}}}}}} }}}}}}}}}}}}}}}}}} }}}}}}} }}}}}}}}}}}} }}}}}}}}}}}}}}}}}} }}}}}}} }}}}}}}}}}}} }}}}}}}}}}}}}}}}}} }}}}}}} }}}}}}}}}}}} }}}}}}}}}}         }}}}}}} }}}}}}}}}}}}         }}}}}}}}}}}}}}}}}} }}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}  @             }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}  %                             }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} ROOM 000 000 K 0 B 0 SHIELD -                                                  "
template4: string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}}}}}}}}}}}}                     }}}}}}}}}}}}}}}}}}} }}}}}}}}}}}}}}      }}}}}}}}}}}}}}}}}}} }}}}}}}}}}}}}}     }}}}}}}}}}}}}                        @  }}}}}}}}}}}}} }}}}}} }}}}}}}}}}}}}      }}}}}         }}}}}} }}}}}}}}}}}}}         }}}}}}}}}}}}}}}}} }}}}}}}}}}}}}}}} } }}}}}}}}}}}}}}}}}}}} }}}}}}}}}}}}     } }}}}}}}}}}}}}}                        } }}}}}}}}}}}}}}                        } }}}}}}}}}}}}}}       }}}}}}}}}}}}}} }}} }}}}  %                                 }}}}}}}}}}}}}}}}}}}                 }}}}}}}}}}}}}}}}}}}}}}}   }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} ROOM 000 000 K 0 B 0 SHIELD -                                                  "
template5: string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}      }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}   $      }}}}}}}  =                        }}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}      }}}}}}}}}}}}} }}}}}}}}}}}}}}}}}}}}      }}}}}}}}}}}}}    }}}}}}}                }}}}}}}}}}}}}    }}}}}}}    }}}}}}      }}}}}}}}}}}}}    }}}}}}}                     }}}}}}}}    }}}}}}}    }}}}}}}}} }}}}}} }}}}}}}} } }}}}}}}}}}}}}}}}}}}}} }}}}}} }}}}}      }}}}}}}}}}}}}}}}}}}}}                   }}}}}}         }}}}}}}}}}}}} }}}}}          }}}}}}}}}} }}}}}}}}}}}}} }}}}}} }}} }}}}}}}}}}}}}} }}}}}}}}}}}}} }}}}}} }}} }}}}}}}}}}}}}} }}}}}}}}}}}}} }}}}}} }}} }}}}}}}}}}}}}} }}}}}}}}}}}}} }}}}}} }}} }}}}}}}}}}}}}} }}}}}}}}}}}}} }}}}}} }}} }}}}}}}}}}}}}} }}}}}}}}}}}}} }}}}}} }}} }}}}}}}}}}}}}} }}}}}}}}}}}}} }}}}}} }}} }}}}}}}}}}}}}} }}}}}}}}}}}    }}}}} }}} }}}}}}}}}}}}}} }}}}}}}}}}}    }}}}} }}} }}}}}}}}}}}}}}                          }}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} ROOM 000 000 K 0 B 0 SHIELD -                                                  "
template6: string "}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}     }}}}}}}}}}}}}}}}}}}}}}}}}}}             }}}}}}}}}  =                }}}}}}}     }}}}}}}}}}}}}}}}}}}}}}}}}}  }}}}}}}}} } }      }}}}}}}}}}}}}}}}}}}   }}}}}}}} } }      }}}         }}}}}                        }}}      }                             }}}}   $                       }}}}}}}}}}}}}      }}}}}}}    }}}}}}}}}}}}}}}}}}}}}}}}}}              }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}    }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}     }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}     }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}     }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} ROOM 000 000 K 0 B 0 SHIELD -                                                  "
tpl_exit: var #6
static tpl_exit + #0, #480
static tpl_exit + #1, #160
static tpl_exit + #2, #960
static tpl_exit + #3, #800
static tpl_exit + #4, #120
static tpl_exit + #5, #440
tpl_coin_spots: var #120
static tpl_coin_spots + #0, #565
static tpl_coin_spots + #1, #977
static tpl_coin_spots + #2, #489
static tpl_coin_spots + #3, #590
static tpl_coin_spots + #4, #57
static tpl_coin_spots + #5, #710
static tpl_coin_spots + #6, #976
static tpl_coin_spots + #7, #985
static tpl_coin_spots + #8, #566
static tpl_coin_spots + #9, #346
static tpl_coin_spots + #10, #983
static tpl_coin_spots + #11, #591
static tpl_coin_spots + #12, #987
static tpl_coin_spots + #13, #754
static tpl_coin_spots + #14, #493
static tpl_coin_spots + #15, #495
static tpl_coin_spots + #16, #596
static tpl_coin_spots + #17, #833
static tpl_coin_spots + #18, #175
static tpl_coin_spots + #19, #789
static tpl_coin_spots + #20, #475
static tpl_coin_spots + #21, #979
static tpl_coin_spots + #22, #374
static tpl_coin_spots + #23, #770
static tpl_coin_spots + #24, #180
static tpl_coin_spots + #25, #169
static tpl_coin_spots + #26, #189
static tpl_coin_spots + #27, #512
static tpl_coin_spots + #28, #593
static tpl_coin_spots + #29, #288
static tpl_coin_spots + #30, #533
static tpl_coin_spots + #31, #490
static tpl_coin_spots + #32, #501
static tpl_coin_spots + #33, #486
static tpl_coin_spots + #34, #195
static tpl_coin_spots + #35, #450
static tpl_coin_spots + #36, #192
static tpl_coin_spots + #37, #534
static tpl_coin_spots + #38, #408
static tpl_coin_spots + #39, #364
static tpl_coin_spots + #40, #828
static tpl_coin_spots + #41, #510
static tpl_coin_spots + #42, #823
static tpl_coin_spots + #43, #989
static tpl_coin_spots + #44, #390
static tpl_coin_spots + #45, #562
static tpl_coin_spots + #46, #260
static tpl_coin_spots + #47, #821
static tpl_coin_spots + #48, #416
static tpl_coin_spots + #49, #565
static tpl_coin_spots + #50, #184
static tpl_coin_spots + #51, #973
static tpl_coin_spots + #52, #376
static tpl_coin_spots + #53, #190
static tpl_coin_spots + #54, #819
static tpl_coin_spots + #55, #986
static tpl_coin_spots + #56, #991
static tpl_coin_spots + #57, #868
static tpl_coin_spots + #58, #271
static tpl_coin_spots + #59, #369
static tpl_coin_spots + #60, #591
static tpl_coin_spots + #61, #550
static tpl_coin_spots + #62, #819
static tpl_coin_spots + #63, #391
static tpl_coin_spots + #64, #386
static tpl_coin_spots + #65, #567
static tpl_coin_spots + #66, #616
static tpl_coin_spots + #67, #565
static tpl_coin_spots + #68, #748
static tpl_coin_spots + #69, #489
static tpl_coin_spots + #70, #827
static tpl_coin_spots + #71, #701
static tpl_coin_spots + #72, #529
static tpl_coin_spots + #73, #432
static tpl_coin_spots + #74, #807
static tpl_coin_spots + #75, #592
static tpl_coin_spots + #76, #855
static tpl_coin_spots + #77, #815
static tpl_coin_spots + #78, #856
static tpl_coin_spots + #79, #816
static tpl_coin_spots + #80, #552
static tpl_coin_spots + #81, #634
static tpl_coin_spots + #82, #969
static tpl_coin_spots + #83, #979
static tpl_coin_spots + #84, #127
static tpl_coin_spots + #85, #510
static tpl_coin_spots + #86, #145
static tpl_coin_spots + #87, #136
static tpl_coin_spots + #88, #569
static tpl_coin_spots + #89, #133
static tpl_coin_spots + #90, #590
static tpl_coin_spots + #91, #929
static tpl_coin_spots + #92, #989
static tpl_coin_spots + #93, #272
static tpl_coin_spots + #94, #392
static tpl_coin_spots + #95, #107
static tpl_coin_spots + #96, #134
static tpl_coin_spots + #97, #512
static tpl_coin_spots + #98, #568
static tpl_coin_spots + #99, #513
static tpl_coin_spots + #100, #591
static tpl_coin_spots + #101, #687
static tpl_coin_spots + #102, #420
static tpl_coin_spots + #103, #665
static tpl_coin_spots + #104, #387
static tpl_coin_spots + #105, #466
static tpl_coin_spots + #106, #897
static tpl_coin_spots + #107, #622
static tpl_coin_spots + #108, #853
static tpl_coin_spots + #109, #428
static tpl_coin_spots + #110, #578
static tpl_coin_spots + #111, #644
static tpl_coin_spots + #112, #427
static tpl_coin_spots + #113, #893
static tpl_coin_spots + #114, #627
static tpl_coin_spots + #115, #605
static tpl_coin_spots + #116, #697
static tpl_coin_spots + #117, #632
static tpl_coin_spots + #118, #736
static tpl_coin_spots + #119, #731
tpl_coin_count: var #6
static tpl_coin_count + #0, #20
static tpl_coin_count + #1, #20
static tpl_coin_count + #2, #20
static tpl_coin_count + #3, #20
static tpl_coin_count + #4, #20
static tpl_coin_count + #5, #20
tpl_shield_spots: var #24
static tpl_shield_spots + #0, #670
static tpl_shield_spots + #1, #790
static tpl_shield_spots + #2, #889
static tpl_shield_spots + #3, #542
static tpl_shield_spots + #4, #405
static tpl_shield_spots + #5, #88
static tpl_shield_spots + #6, #51
static tpl_shield_spots + #7, #491
static tpl_shield_spots + #8, #261
static tpl_shield_spots + #9, #147
static tpl_shield_spots + #10, #176
static tpl_shield_spots + #11, #229
static tpl_shield_spots + #12, #511
static tpl_shield_spots + #13, #833
static tpl_shield_spots + #14, #502
static tpl_shield_spots + #15, #746
static tpl_shield_spots + #16, #609
static tpl_shield_spots + #17, #595
static tpl_shield_spots + #18, #974
static tpl_shield_spots + #19, #63
static tpl_shield_spots + #20, #595
static tpl_shield_spots + #21, #388
static tpl_shield_spots + #22, #548
static tpl_shield_spots + #23, #895
tpl_shield_count: var #6
static tpl_shield_count + #0, #4
static tpl_shield_count + #1, #4
static tpl_shield_count + #2, #4
static tpl_shield_count + #3, #4
static tpl_shield_count + #4, #4
static tpl_shield_count + #5, #4
tpl_trap_spots: var #120
static tpl_trap_spots + #0, #503
static tpl_trap_spots + #1, #138
static tpl_trap_spots + #2, #217
static tpl_trap_spots + #3, #666
static tpl_trap_spots + #4, #219
static tpl_trap_spots + #5, #97
static tpl_trap_spots + #6, #746
static tpl_trap_spots + #7, #946
static tpl_trap_spots + #8, #137
static tpl_trap_spots + #9, #544
static tpl_trap_spots + #10, #752
static tpl_trap_spots + #11, #826
static tpl_trap_spots + #12, #299
static tpl_trap_spots + #13, #504
static tpl_trap_spots + #14, #906
static tpl_trap_spots + #15, #753
static tpl_trap_spots + #16, #706
static tpl_trap_spots + #17, #751
static tpl_trap_spots + #18, #866
static tpl_trap_spots + #19, #65535
static tpl_trap_spots + #20, #940
static tpl_trap_spots + #21, #133
static tpl_trap_spots + #22, #942
static tpl_trap_spots + #23, #939
static tpl_trap_spots + #24, #93
static tpl_trap_spots + #25, #283
static tpl_trap_spots + #26, #982
static tpl_trap_spots + #27, #52
static tpl_trap_spots + #28, #53
static tpl_trap_spots + #29, #284
static tpl_trap_spots + #30, #323
static tpl_trap_spots + #31, #285
static tpl_trap_spots + #32, #65535
static tpl_trap_spots + #33, #65535
static tpl_trap_spots + #34, #65535
static tpl_trap_spots + #35, #65535
static tpl_trap_spots + #36, #65535
static tpl_trap_spots + #37, #65535
static tpl_trap_spots + #38, #65535
static tpl_trap_spots + #39, #65535
static tpl_trap_spots + #40, #948
static tpl_trap_spots + #41, #815
static tpl_trap_spots + #42, #816
static tpl_trap_spots + #43, #908
static tpl_trap_spots + #44, #413
static tpl_trap_spots + #45, #414
static tpl_trap_spots + #46, #775
static tpl_trap_spots + #47, #778
static tpl_trap_spots + #48, #776
static tpl_trap_spots + #49, #65535
static tpl_trap_spots + #50, #65535
static tpl_trap_spots + #51, #65535
static tpl_trap_spots + #52, #65535
static tpl_trap_spots + #53, #65535
static tpl_trap_spots + #54, #65535
static tpl_trap_spots + #55, #65535
static tpl_trap_spots + #56, #65535
static tpl_trap_spots + #57, #65535
static tpl_trap_spots + #58, #65535
static tpl_trap_spots + #59, #65535
static tpl_trap_spots + #60, #673
static tpl_trap_spots + #61, #393
static tpl_trap_spots + #62, #813
static tpl_trap_spots + #63, #694
static tpl_trap_spots + #64, #392
static tpl_trap_spots + #65, #553
static tpl_trap_spots + #66, #814
static tpl_trap_spots + #67, #690
static tpl_trap_spots + #68, #691
static tpl_trap_spots + #69, #692
static tpl_trap_spots + #70, #354
static tpl_trap_spots + #71, #812
static tpl_trap_spots + #72, #394
static tpl_trap_spots + #73, #473
static tpl_trap_spots + #74, #693
static tpl_trap_spots + #75, #353
static tpl_trap_spots + #76, #811
static tpl_trap_spots + #77, #633
static tpl_trap_spots + #78, #65535
static tpl_trap_spots + #79, #65535
static tpl_trap_spots + #80, #435
static tpl_trap_spots + #81, #315
static tpl_trap_spots + #82, #66
static tpl_trap_spots + #83, #395
static tpl_trap_spots + #84, #68
static tpl_trap_spots + #85, #67
static tpl_trap_spots + #86, #355
static tpl_trap_spots + #87, #64
static tpl_trap_spots + #88, #433
static tpl_trap_spots + #89, #65
static tpl_trap_spots + #90, #65535
static tpl_trap_spots + #91, #65535
static tpl_trap_spots + #92, #65535
static tpl_trap_spots + #93, #65535
static tpl_trap_spots + #94, #65535
static tpl_trap_spots + #95, #65535
static tpl_trap_spots + #96, #65535
static tpl_trap_spots + #97, #65535
static tpl_trap_spots + #98, #65535
static tpl_trap_spots + #99, #65535
static tpl_trap_spots + #100, #814
static tpl_trap_spots + #101, #516
static tpl_trap_spots + #102, #538
static tpl_trap_spots + #103, #469
static tpl_trap_spots + #104, #607
static tpl_trap_spots + #105, #515
static tpl_trap_spots + #106, #816
static tpl_trap_spots + #107, #552
static tpl_trap_spots + #108, #513
static tpl_trap_spots + #109, #698
static tpl_trap_spots + #110, #514
static tpl_trap_spots + #111, #467
static tpl_trap_spots + #112, #602
static tpl_trap_spots + #113, #517
static tpl_trap_spots + #114, #512
static tpl_trap_spots + #115, #557
static tpl_trap_spots + #116, #498
static tpl_trap_spots + #117, #65535
static tpl_trap_spots + #118, #65535
static tpl_trap_spots + #119, #65535
tpl_trap_count: var #6
static tpl_trap_count + #0, #19
static tpl_trap_count + #1, #12
static tpl_trap_count + #2, #9
static tpl_trap_count + #3, #18
static tpl_trap_count + #4, #10
static tpl_trap_count + #5, #17
; ══ endless data end ══
                         
main:
	; Fresh game state
	loadn r6, #0
	store coin_count, r6
	store coin_record, r6
	store key_count, r6
	store level_index, r6
	
	; Print the title screen
	loadn r0, #0
	loadn r1, #menu_art
	call print_string

; ────────────┤ Waits for Enter on the title screen ├────────────
wait_start:
	loadn r2, #13		; Enter character
	inchar r1
	cmp r1, r2
	jne wait_start
	
menu_entry:
	call main_menu		; r5 = selected entry
	loadn r6, #0
	cmp r5, r6
	jeq start_game
	loadn r6, #1
	cmp r5, r6
	jeq endless_entry
	; settings entry
	settings_entry:
	call settings_screen
	jmp menu_entry
	
	endless_entry:
	loadn r6, #2
	store game_mode, r6
	loadn r6, #0
	store coin_count, r6
	store coin_record, r6
	loadn r6, #1
	store endless_depth, r6
	loadn r6, #44257
	store rng_seed, r6
	; the first room is entered from the right, the side the player will keep
	; entering from because every endless exit opens in the left wall
	loadn r6, #1
	store entry_side, r6
	call generate_room
	call enter_room
	jmp read_direction
	
; ────────────┤ Waits for Enter ├────────────
wait_enter:
	loadn r2, #13
	wait_enter_loop:
	inchar r1
	cmp r1, r2
	jne wait_enter_loop
	rts
		
start_game:
	loadn r6, #1
	store game_mode, r6
	call start_level	; r0 = player position after this call
	jmp read_direction

; ────────────┤ Starts the selected level ├────────────
start_level:
	load r6, coin_count	; Snapshot the coin count for this level
	store coin_record, r6
	call load_level
	rts

; ────────────┤ Main menu: pick a game mode ├────────────
; Returns r5 = 0 normal mode, 1 endless mode, 2 settings
main_menu:
	push r0
	push r1
	push r2
	push r3
	push r6
	loadn r0, #0
	loadn r1, #menu_list_art
	call print_string
	loadn r6, #0			; selected entry
	call menu_cursor
	menu_loop:
	inchar r1
	loadn r2, #17
	cmp r1, r2
	jeq menu_up
	loadn r2, #18
	cmp r1, r2
	jeq menu_down
	loadn r2, #'w'
	cmp r1, r2
	jeq menu_up
	loadn r2, #'a'
	cmp r1, r2
	jeq menu_up
	loadn r2, #'s'
	cmp r1, r2
	jeq menu_down
	loadn r2, #'d'
	cmp r1, r2
	jeq menu_down
	loadn r2, #13
	cmp r1, r2
	jeq menu_done
	jmp menu_loop
	menu_up:
	loadn r2, #0
	cmp r6, r2
	jne menu_up_dec
	loadn r6, #2
	jmp menu_moved
	menu_up_dec:
	dec r6
	jmp menu_moved
	menu_down:
	loadn r2, #2
	cmp r6, r2
	jne menu_down_inc
	loadn r6, #0
	jmp menu_moved
	menu_down_inc:
	inc r6
	menu_moved:
	call menu_cursor
	jmp menu_loop
	menu_done:
	mov r5, r6
	pop r6
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Draws the menu selection marker for r6 ├────────────
menu_cursor:
	push r0
	push r1
	push r2
	loadn r1, #' '
	loadn r0, #411
	outchar r1, r0
	loadn r0, #491
	outchar r1, r0
	loadn r0, #571
	outchar r1, r0
	loadn r2, #80
	mul r2, r6, r2
	loadn r0, #411
	add r0, r0, r2
	loadn r1, #'>'
	outchar r1, r0
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Settings screen ├────────────
settings_screen:
	push r0
	push r1
	push r2
	push r3
	push r6
	loadn r0, #0
	loadn r1, #settings_art
	call print_string
	loadn r6, #0
	call settings_draw
	settings_loop:
	inchar r1
	loadn r2, #17
	cmp r1, r2
	jeq settings_up
	loadn r2, #18
	cmp r1, r2
	jeq settings_down
	loadn r2, #'w'
	cmp r1, r2
	jeq settings_up
	loadn r2, #'a'
	cmp r1, r2
	jeq settings_up
	loadn r2, #'s'
	cmp r1, r2
	jeq settings_down
	loadn r2, #'d'
	cmp r1, r2
	jeq settings_down
	loadn r2, #13
	cmp r1, r2
	jeq settings_enter
	jmp settings_loop
	settings_up:
	loadn r2, #0
	cmp r6, r2
	jne settings_up_dec
	loadn r6, #3
	jmp settings_moved
	settings_up_dec:
	dec r6
	jmp settings_moved
	settings_down:
	loadn r2, #3
	cmp r6, r2
	jne settings_down_inc
	loadn r6, #0
	jmp settings_moved
	settings_down_inc:
	inc r6
	settings_moved:
	call settings_clear_msg
	call settings_draw
	jmp settings_loop
	settings_enter:
	loadn r2, #0
	cmp r6, r2
	jeq settings_cycle_speed
	loadn r2, #3
	cmp r6, r2
	jeq settings_done
	; sound rows are reserved for a future update
	loadn r0, #723
	loadn r1, #msg_sound_reserved
	call print_string
	jmp settings_loop
	settings_cycle_speed:
	load r2, speed_idx
	inc r2
	loadn r3, #3
	mod r2, r2, r3
	store speed_idx, r2
	call settings_apply_speed
	call settings_draw
	jmp settings_loop
	settings_done:
	pop r6
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Draws the settings cursor and speed value ├────────────
settings_draw:
	push r0
	push r1
	push r2
	push r3
	loadn r1, #' '
	loadn r0, #282
	outchar r1, r0
	loadn r0, #362
	outchar r1, r0
	loadn r0, #442
	outchar r1, r0
	loadn r0, #522
	outchar r1, r0
	loadn r2, #80
	mul r2, r6, r2
	loadn r0, #282
	add r0, r0, r2
	loadn r1, #'>'
	outchar r1, r0
	loadn r0, #302
	load r2, speed_idx
	loadn r3, #0
	cmp r2, r3
	jeq settings_draw_slow
	loadn r3, #1
	cmp r2, r3
	jeq settings_draw_normal
	loadn r1, #speed_name_fast
	jmp settings_draw_value
	settings_draw_slow:
	loadn r1, #speed_name_slow
	jmp settings_draw_value
	settings_draw_normal:
	loadn r1, #speed_name_normal
	settings_draw_value:
	call print_string
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Clears the settings message line ├────────────
settings_clear_msg:
	push r0
	push r1
	loadn r0, #723
	loadn r1, #msg_blank40
	call print_string
	pop r1
	pop r0
	rts

; ────────────┤ Applies the dash speed preset to loop_count ├────────────
settings_apply_speed:
	load r2, speed_idx
	loadn r3, #0
	cmp r2, r3
	jeq settings_apply_slow
	loadn r3, #1
	cmp r2, r3
	jeq settings_apply_normal
	loadn r1, #110
	jmp settings_apply_store
	settings_apply_slow:
	loadn r1, #300
	jmp settings_apply_store
	settings_apply_normal:
	loadn r1, #180
	settings_apply_store:
	store loop_count, r1
	rts

; ────────────┤ Picks the level data for level_index ├────────────
; Returns r1 = level string, r5 = exit cell, r6 = start, r7 = flip list
pick_level_data:
	load r4, level_index
	loadn r3, #0
	cmp r4, r3
	jne pick_not_one
	loadn r1, #level1
	loadn r7, #flip1
	load r5, exit1
	load r6, start1
	rts
	
	pick_not_one:
	loadn r3, #1
	cmp r4, r3
	jne pick_not_two
	loadn r1, #level2
	loadn r7, #flip2
	load r5, exit2
	load r6, start2
	rts
	
	pick_not_two:
	loadn r3, #2
	cmp r4, r3
	jne pick_not_three
	loadn r1, #level3
	loadn r7, #flip3
	load r5, exit3
	load r6, start3
	rts
	
	pick_not_three:
	loadn r3, #3
	cmp r4, r3
	jne pick_not_four
	loadn r1, #level4
	loadn r7, #flip4
	load r5, exit4
	load r6, start4
	rts
	
	pick_not_four:
	loadn r1, #level5
	loadn r7, #flip5
	load r5, exit5
	load r6, start5
	rts

; ────────────┤ Copies the selected level into the working map ├────────────
load_level:
	call pick_level_data	; r1 = level | r5 = exit | r6 = start | r7 = flip list
	jmp load_level_from

; ────────────┤ Loads a prepared level string ├────────────
; r1 = level string | r5 = exit | r6 = start | r7 = flip list
load_level_from:
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	store flip_list_cur, r7
	store start_position, r6
	store exit_pos, r5
	
	; Copy the level string into the working map
	loadn r2, #map
	loadn r5, #1201
	load_level_copy:
	loadi r3, r1
	storei r2, r3
	inc r1
	inc r2
	dec r5
	jnz load_level_copy
	
	; Clear the counters that belong to one level
	loadn r6, #0
	store key_count, r6
	store bomb_count, r6
	store shield, r6
	
	; Print the board, the player, the counters and a clean message line
	loadn r0, #0
	loadn r1, #map
	call print_string
	load r0, start_position	; r0 = player start position
	call print_player
	call draw_hud
	loadn r1, #msg_blank
	call show_message
	
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	rts

; ══ endless code begin ══
; ────────────┤ 16 bit pseudo random generator ├────────────
; seed = seed * 25173 mod 65536, returns the value in r5 (clobbers r1)
rng_next:
	push r1
	load r5, rng_seed
	loadn r1, #25173
	mul r5, r5, r1
	loadn r1, #65535
	and r5, r5, r1
	store rng_seed, r5
	pop r1
	rts

; r6 = range, returns a random value below it in r5.
; The high bits are used because the low bits of this generator cycle fast.
rng_mod:
	push r1
	call rng_next
	loadn r1, #256
	div r5, r5, r1
	mod r5, r5, r6
	pop r1
	rts

; ────────────┤ Mirrors a cell index for the chosen orientation ├────────────
; r5 = index in, transformed index out, uses gen_orient (clobbers r0..r3)
transform_index:
	push r0
	push r1
	push r2
	push r3
	loadn r1, #40
	div r0, r5, r1		; row
	mod r2, r5, r1		; column
	load r1, gen_orient
	loadn r3, #1
	and r1, r1, r3
	loadn r3, #0
	cmp r1, r3
	jeq transform_no_h
	loadn r3, #39
	sub r2, r3, r2		; column mirrored
	transform_no_h:
	load r1, gen_orient
	loadn r3, #2
	and r1, r1, r3
	loadn r3, #0
	cmp r1, r3
	jeq transform_no_v
	loadn r3, #27
	sub r0, r3, r0		; row mirrored
	transform_no_v:
	loadn r1, #40
	mul r0, r0, r1
	add r5, r0, r2
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Picks the template string for gen_tpl ├────────────
; r6 = index, returns the string address in r1 (clobbers r1, r2)
pick_template:
	loadn r1, #0
	cmp r6, r1
	jne pick_template2
	loadn r1, #template1
	rts
	pick_template2:
	loadn r1, #1
	cmp r6, r1
	jne pick_template3
	loadn r1, #template2
	rts
	pick_template3:
	loadn r1, #2
	cmp r6, r1
	jne pick_template4
	loadn r1, #template3
	rts
	pick_template4:
	loadn r1, #3
	cmp r6, r1
	jne pick_template5
	loadn r1, #template4
	rts
	pick_template5:
	loadn r1, #4
	cmp r6, r1
	jne pick_template6
	loadn r1, #template5
	rts
	pick_template6:
	loadn r1, #template6
	rts

; ────────────┤ Copies a template into room_buf with the orientation ├────────────
; r1 = template string, uses gen_orient
copy_template:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	loadn r0, #0
	copy_template_row:
	load r2, gen_orient
	loadn r3, #2
	and r2, r2, r3
	loadn r3, #0
	cmp r2, r3
	jeq copy_template_nov
	loadn r2, #27
	sub r2, r2, r0
	jmp copy_template_have_row
	copy_template_nov:
	mov r2, r0
	copy_template_have_row:
	loadn r3, #40
	mul r2, r2, r3
	mul r4, r0, r3
	add r2, r2, r1
	loadn r5, #room_buf
	add r5, r5, r4
	load r6, gen_orient
	loadn r7, #1
	and r6, r6, r7
	loadn r7, #0
	cmp r6, r7
	jeq copy_template_forward
	loadn r6, #39
	add r2, r2, r6
	loadn r6, #40
	copy_template_rev:
	loadi r3, r2
	storei r5, r3
	dec r2
	inc r5
	dec r6
	jnz copy_template_rev
	jmp copy_template_row_done
	copy_template_forward:
	loadn r6, #40
	copy_template_fwd:
	loadi r3, r2
	storei r5, r3
	inc r2
	inc r5
	dec r6
	jnz copy_template_fwd
	copy_template_row_done:
	inc r0
	loadn r2, #28
	cmp r0, r2
	jne copy_template_row
	; the HUD and message rows are copied verbatim
	loadn r2, #1120
	add r2, r2, r1
	loadn r3, #room_buf
	loadn r4, #1120
	add r3, r3, r4
	loadn r6, #80
	copy_template_tail:
	loadi r4, r2
	storei r3, r4
	inc r2
	inc r3
	dec r6
	jnz copy_template_tail
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Places items on the pre-screened spots of a room ├────────────
; r6 = spots table, r7 = count table, r0 = spot stride, r3 = tile, r4 = how many
; leaves r1, r2, r5 clobbered, consumes r4
sprinkle:
	push r0
	push r1
	push r2
	push r5
	sprinkle_loop:
	loadn r1, #0
	cmp r4, r1
	jeq sprinkle_done
	load r2, gen_tpl
	mov r1, r7
	add r1, r1, r2
	loadi r2, r1		; r2 = how many spots this template has
	loadn r1, #0
	cmp r2, r1
	jeq sprinkle_done
	push r6
	mov r6, r2
	call rng_mod		; r5 = slot
	pop r6
	load r2, gen_tpl
	mul r1, r2, r0		; template * stride
	add r1, r1, r5
	add r1, r1, r6
	loadi r5, r1		; the cell index of the spot
	call transform_index
	loadn r1, #room_buf
	add r1, r1, r5
	loadi r2, r1
	loadn r5, #' '		; r5 is free once the address is built
	cmp r2, r5
	jne sprinkle_skip
	storei r1, r3
	sprinkle_skip:
	loadn r1, #0
	cmp r4, r1
	jeq sprinkle_done
	dec r4
	jmp sprinkle_loop
	sprinkle_done:
	pop r5
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Stamps the room number into the generated HUD ├────────────
stamp_depth:
	push r0
	push r1
	push r2
	push r3
	loadn r1, #room_buf
	loadn r2, #1126
	add r1, r1, r2
	load r0, endless_depth
	loadn r2, #100
	div r3, r0, r2
	loadn r2, #48
	add r3, r2, r3
	storei r1, r3
	inc r1
	load r0, endless_depth
	loadn r2, #10
	div r3, r0, r2
	mod r3, r3, r2
	loadn r2, #48
	add r3, r2, r3
	storei r1, r3
	inc r1
	load r0, endless_depth
	loadn r2, #10
	mod r3, r0, r2
	loadn r2, #48
	add r3, r2, r3
	storei r1, r3
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Generates the next endless room into room_buf ├────────────
generate_room:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	loadn r6, #6
	call rng_mod
	store gen_tpl, r5
	; the room is mirrored whenever the player enters from the left, so the
	; exit always sits on the opposite wall and the entrances alternate room
	; by room while the slide keeps matching the exit that was used
	load r5, entry_side
	loadn r6, #1
	sub r5, r6, r5
	store gen_orient, r5
	load r6, gen_tpl
	call pick_template
	call copy_template
	; the player enters on the same side as the exit that was used, and the
	; exit of this room opens in the opposite wall
	load r5, entry_side
	loadn r6, #0
	cmp r5, r6
	jne generate_start_right
	loadn r5, #561		; (14,1) entrance corridor
	jmp generate_start_ready
	generate_start_right:
	loadn r5, #598		; (14,38) entrance corridor
	generate_start_ready:
	store endless_start, r5
	load r6, gen_tpl
	loadn r2, #tpl_exit
	add r2, r2, r6
	loadi r5, r2
	call transform_index
	store endless_exit, r5
	; coins: 7 + rng % 4
	loadn r6, #4
	call rng_mod
	loadn r1, #7
	add r5, r5, r1
	mov r4, r5
	loadn r6, #tpl_coin_spots
	loadn r7, #tpl_coin_count
	loadn r3, #'*'
	loadn r0, #20
	call sprinkle
	; shield: 0 or 1
	loadn r6, #2
	call rng_mod
	mov r4, r5
	loadn r6, #tpl_shield_spots
	loadn r7, #tpl_shield_count
	loadn r3, #'^'
	loadn r0, #4
	call sprinkle
	; traps: 1 + depth / 2, capped at 4
	load r4, endless_depth
	loadn r1, #2
	div r4, r4, r1
	inc r4
	loadn r1, #4
	cmp r4, r1
	jgr generate_trap_cap
	jmp generate_trap_count
	generate_trap_cap:
	loadn r4, #4
	generate_trap_count:
	loadn r6, #tpl_trap_spots
	loadn r7, #tpl_trap_count
	loadn r3, #'{'
	loadn r0, #20
	call sprinkle
	call stamp_depth
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Copies the generated room into the map and starts it ├────────────
enter_room:
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	load r6, endless_start
	store start_position, r6
	load r6, endless_exit
	store exit_pos, r6
	loadn r6, #empty_flip
	store flip_list_cur, r6
	loadn r1, #room_buf
	loadn r2, #map
	loadn r5, #1201
	enter_room_copy:
	loadi r3, r1
	storei r2, r3
	inc r1
	inc r2
	dec r5
	jnz enter_room_copy
	loadn r6, #0
	store key_count, r6
	store bomb_count, r6
	store shield, r6
	loadn r0, #0
	loadn r1, #map
	call print_string
	; entrance gate: shut, open as the player steps in, shut again behind
	call entrance_gate_cell		; r4 = the entrance wall cell
	loadn r1, #3109			; '%' in the gate color
	outchar r1, r4
	loadn r6, #3
	enter_gate_pause1:
	call delay_clock
	dec r6
	jnz enter_gate_pause1
	loadn r1, #' '
	outchar r1, r4			; the gate opens
	load r0, start_position
	call print_player		; the player steps in
	loadn r6, #3
	enter_gate_pause2:
	call delay_clock
	dec r6
	jnz enter_gate_pause2
	loadn r1, #3109
	outchar r1, r4			; the gate closes behind the player
	loadn r6, #3
	enter_gate_pause3:
	call delay_clock
	dec r6
	jnz enter_gate_pause3
	call draw_hud
	loadn r1, #msg_blank
	call show_message
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	rts

; ────────────┤ Prints a 3 digit number ├────────────
; r5 = value, r0 = screen position
print_uint3:
	push r1
	push r2
	push r3
	push r4
	loadn r4, #100
	div r1, r5, r4
	loadn r3, #48
	add r1, r3, r1
	loadn r3, #2816
	add r1, r3, r1
	outchar r1, r0
	loadn r4, #10
	div r2, r5, r4
	mod r2, r2, r4
	loadn r3, #48
	add r2, r3, r2
	loadn r3, #2816
	add r2, r3, r2
	inc r0
	outchar r2, r0
	mod r2, r5, r4
	loadn r3, #48
	add r2, r3, r2
	loadn r3, #2816
	add r2, r3, r2
	inc r0
	outchar r2, r0
	pop r4
	pop r3
	pop r2
	pop r1
	rts

; ────────────┤ Returns the entrance wall cell for entry_side ├────────────
entrance_gate_cell:
	load r4, entry_side
	loadn r5, #0
	cmp r4, r5
	jne entrance_gate_right
	loadn r4, #560			; (14,0), entered from the left
	rts
	entrance_gate_right:
	loadn r4, #599			; (14,39), entered from the right
	rts

; ────────────┤ Decides which wall the next room is entered from ├────────────
; The entrance sits opposite the exit that was used, so exiting through the
; left wall drops the player on the right side of the new room and the room
; keeps entering from the side the slide came from.
compute_entry_side:
	push r1
	push r2
	push r3
	load r2, exit_pos
	loadn r3, #40
	mod r2, r2, r3
	loadn r3, #0
	cmp r2, r3
	jne entry_side_from_left
	loadn r1, #1			; exited left, the player enters on the right
	store entry_side, r1
	jmp compute_entry_side_done
	entry_side_from_left:
	loadn r1, #0			; exited right, the player enters on the left
	store entry_side, r1
	compute_entry_side_done:
	pop r3
	pop r2
	pop r1
	rts

; ────────────┤ End of the endless run ├────────────
game_over_screen:
	push r0
	push r1
	push r5
	loadn r0, #0
	loadn r1, #blank_screen
	call print_string
	loadn r0, #124
	loadn r1, #msg_game_over
	call print_string
	loadn r0, #244
	loadn r1, #msg_rooms_cleared
	call print_string
	load r5, endless_depth
	loadn r1, #1
	sub r5, r5, r1
	loadn r0, #259
	call print_uint3
	loadn r0, #324
	loadn r1, #msg_coins_label
	call print_string
	load r5, coin_count
	loadn r0, #331
	call print_uint3
	loadn r0, #484
	loadn r1, #msg_press_enter
	call print_string
	call wait_enter
	jmp main
; ══ endless code end ══

; ────────────┤ Draws the counters line ├────────────
; r0 = screen position, r1 = plain char, r2 = color base (bits 11..8, 0 = no color)
; The char is mirrored into the working map so the level scroll shows the
; counters of the moment while the old room slides away.
hud_put:
	push r3
	loadn r3, #map
	add r3, r3, r0
	storei r3, r1
	loadn r3, #0
	cmp r2, r3
	jeq hud_put_plain
	add r1, r2, r1
	hud_put_plain:
	outchar r1, r0
	pop r3
	rts

draw_hud:
	push r0
	push r1
	push r2
	push r3
	push r4
	
	; Coins, three digits
	load r2, coin_count
	loadn r4, #100
	div r1, r2, r4
	loadn r3, #48
	add r1, r3, r1
	loadn r0, #1130
	loadn r2, #2816		; yellow
	call hud_put
	load r2, coin_count
	loadn r4, #10
	div r1, r2, r4
	mod r1, r1, r4
	loadn r3, #48
	add r1, r3, r1
	loadn r0, #1131
	loadn r2, #2816		; yellow
	call hud_put
	load r2, coin_count
	mod r1, r2, r4
	loadn r3, #48
	add r1, r3, r1
	loadn r0, #1132
	loadn r2, #2816		; yellow
	call hud_put
	
	; Keys, one digit
	load r2, key_count
	loadn r3, #48
	add r1, r3, r2
	loadn r0, #1136
	loadn r2, #1792		; silver
	call hud_put
	
	; Bombs, one digit
	load r2, bomb_count
	loadn r3, #48
	add r1, r3, r2
	loadn r0, #1140
	loadn r2, #2304		; red
	call hud_put
	
	; Shield state
	load r2, shield
	loadn r3, #0
	cmp r2, r3
	jeq draw_hud_no_shield
	loadn r1, #'^'
	loadn r2, #3584		; aqua
	jmp draw_hud_shield_done
	draw_hud_no_shield:
	loadn r1, #'-'
	loadn r2, #0
	draw_hud_shield_done:
	loadn r0, #1149
	call hud_put
	
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Prints a message on the bottom line ├────────────
show_message:
	push r0
	push r1
	push r2
	push r3
	mov r3, r1		; Keep the message address
	
	; Clear the whole line first
	loadn r0, #1160
	loadn r2, #1200
	show_message_clear:
	cmp r0, r2
	jeq show_message_print
	loadn r1, #' '
	outchar r1, r0
	inc r0
	jmp show_message_clear
	
	show_message_print:
	loadn r0, #1160
	mov r1, r3
	call print_string
	
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Restarts the current level ├────────────
restart_level:
	load r6, coin_record	; Coins go back to the level start value
	store coin_count, r6
	call load_level
	rts

; Uses one bomb and destroys the breakable walls around the player
use_bomb:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	
	load r4, bomb_count
	loadn r5, #0
	cmp r4, r5
	jne use_bomb_has
	loadn r1, #msg_nobomb
	call show_message
	jmp use_bomb_end		; No bombs in hand
	use_bomb_has:
	
	loadn r5, #0		; r5 = how many walls broke
	
	; Check the four neighbours around the player
	loadn r1, #40
	sub r2, r0, r1
	call bomb_hit
	add r2, r0, r1
	call bomb_hit
	loadn r1, #1
	sub r2, r0, r1
	call bomb_hit
	add r2, r0, r1
	call bomb_hit
	
	loadn r1, #0
	cmp r5, r1
	jne use_bomb_broke
	loadn r1, #msg_nothing
	call show_message
	jmp use_bomb_end		; Nothing to break, keep the bomb
	use_bomb_broke:
	load r4, bomb_count
	dec r4
	store bomb_count, r4
	call draw_hud
	
	use_bomb_end:
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; Breaks a breakable wall at the position in r2
bomb_hit:
	push r1
	push r3
	push r4
	loadn r1, #map
	add r1, r1, r2
	loadi r3, r1
	loadn r4, #'|'
	cmp r3, r4
	jne bomb_hit_end
	loadn r3, #' '
	storei r1, r3		; Remove the wall from the map
	outchar r3, r2		; Clear the wall on the screen
	inc r5			; Count the broken wall
	bomb_hit_end:
	pop r4
	pop r3
	pop r1
	rts

; Toggles every tile in the current flip list
flip_layout:
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	load r1, flip_list_cur
	flip_layout_loop:
	loadi r2, r1		; r2 = next cell index
	loadn r3, #0
	cmp r2, r3
	jeq flip_layout_end	; End of the list
	inc r1
	
	loadn r4, #map
	add r4, r4, r2
	loadi r5, r4
	loadn r6, #'!'
	cmp r5, r6
	jeq flip_open
	
	; The cell closes
	loadn r5, #'!'
	storei r4, r5
	loadn r5, #'!'
	loadn r6, #1024		; Toggle wall color
	add r5, r5, r6
	outchar r5, r2
	jmp flip_layout_loop
	
	flip_open:
	loadn r5, #' '
	storei r4, r5
	outchar r5, r2
	jmp flip_layout_loop
	
	flip_layout_end:
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	rts

; ────────────┤ Movement reading ├────────────
read_direction:
	loadn r1, #0
	loadn r2, #0
	
	inchar r1		; r1 = dir | direction read from the user
	
	cmp r1, r2		; read nothing -> loop to read again
	jeq read_direction
	; endless runs: mix every key into the generator seed so runs differ
	loadn r2, #2
	load r3, game_mode
	cmp r3, r2
	jne read_seed_mixed
	push r1
	call rng_next
	pop r1
	xor r5, r5, r1
	store rng_seed, r5
	read_seed_mixed:
	
	; Turn uppercase letters into lowercase
	loadn r2, #'A'
	cmp r1, r2
	jle keys_checked
	loadn r2, #'Z'
	cmp r1, r2
	jgr keys_checked
	loadn r2, #32
	add r1, r1, r2
	
	keys_checked:
	; Bomb key
	loadn r2, #'b'
	cmp r1, r2
	jne check_restart
	call use_bomb
	jmp read_direction
	
	check_restart:
	; Restart key
	loadn r2, #'r'
	cmp r1, r2
	jne check_quick_restart
	call restart_level
	jmp read_direction
	
	check_quick_restart:
	; Grave key ` (0x60) - quick restart of the current level
	loadn r2, #96
	cmp r1, r2
	jne check_help
	call restart_level
	jmp read_direction
	
	check_help:
	; Help overlay: H or Tab (Tab needs the patched simulator)
	loadn r2, #'h'
	cmp r1, r2
	jeq open_help
	loadn r2, #9
	cmp r1, r2
	jne check_menu_key
	open_help:
	call help_screen
	jmp read_direction
	
	check_menu_key:
	; Back to the title screen and the main menu
	loadn r2, #'m'
	cmp r1, r2
	jne check_arrows
	jmp main
	
	check_arrows:
	; The simulator forwards the arrow keys as 17..20
	loadn r2, #17
	cmp r1, r2
	jne arrow_not_up
	loadn r1, #'w'
	jmp check_movement
	arrow_not_up:
	loadn r2, #18
	cmp r1, r2
	jne arrow_not_down
	loadn r1, #'s'
	jmp check_movement
	arrow_not_down:
	loadn r2, #19
	cmp r1, r2
	jne arrow_not_left
	loadn r1, #'a'
	jmp check_movement
	arrow_not_left:
	loadn r2, #20
	cmp r1, r2
	jne check_movement
	loadn r1, #'d'

; r1 = direction read
check_movement:
	; ────────────┤ Vertical movement check ├────────────
	loadn r3, #0	; speed[0] = #40 -> vertical (up || down)
	
	; ────────────┤ Up check ├────────────
	loadn r2, #'w'
	cmp r1, r2		; dir == 'w'
	loadn r5, #speed_decrement
	jeq speed_decrement
	
	; ────────────┤ Down check ├────────────
	loadn r2, #'s'
	cmp r1, r2		; dir == 's'
	loadn r5, #speed_increment
	jeq speed_increment
	
	; ────────────┤ Horizontal movement check ├────────────
	loadn r3, #1	; speed[1] = #1 -> horizontal (left || right)
	
	; ────────────┤ Right check ├────────────
	loadn r2, #'d'
	cmp r1, r2		; dir == 'd'
	loadn r5, #speed_increment
	jeq speed_increment

	; ────────────┤ Left check ├────────────
	loadn r2, #'a'	; speed[3] = going left
	cmp r1, r2		; dir == 'a'
	loadn r5, #speed_decrement
	jeq speed_decrement
	
	jmp read_direction	; If nothing moved -> read input again

; ────────────┤ End of movement reading ├────────────	

; ────────────┤ Speed functions ├────────────
; Generate the movement speed in r2
; Continuous movement jumps to r5 (avoids unnecessary ifs)
speed_increment:	; Movement right or down -> increment pos
	nop
	loadn r1, #speed	; r1 = end(speed)
	add r1, r1, r3			; r1 = end(speed[i])
	loadi r2, r1			; r2 = speed[i]
	
	add r1, r0, r2	; r1 = next_pos | next_pos = current_pos + speed
	
	jmp check_collision

speed_decrement:	; Movement left or up -> decrement pos
	nop
	loadn r1, #speed	; r1 = end(speed)
	add r1, r1, r3			; r1 = end(speed[i])
	loadi r2, r1			; r2 = speed[i]
	
	sub r1, r0, r2	; r1 = next_pos | next_pos = current_pos - speed

; ────────────┤ Collision logic ├────────────
; r0 = current_pos | r2 = speed
check_collision:
	; ────┤ Boundary exit: dashed into the outer wall opening ├────
	load r4, exit_pos
	cmp r1, r4
	jeq exit_reached
	loadn r6, #map	; r6 = end(map)
	add r6, r6, r1	; r6 = end(map[next_pos])
	loadi r6, r6	; r6 = map[next_pos] | sprite we will compare
	
	; ────┤ Empty position: keep moving ├────
	loadn r4, #' '
	cmp r6, r4
	jne position_not_empty
	
	call move_player
	; Keep moving: jump to the speed function (its address is in r5)
	push r5
	rts
	; ────────────────────────────────────────
	
	position_not_empty:
	; ────┤ Coin: get rich ├────
	loadn r4, #'*'
	cmp r6, r4
	jne no_coin_collected

	call update_coins	
	call move_player
	; Keep moving: jump to the speed function (its address is in r5)
	push r5
	rts
	; ────────────────────────────────────────
	
	no_coin_collected:
	; ────┤ Box: push it ahead ├────
	loadn r4, #'#'
	cmp r6, r4
	jne no_box_hit
	
	push r3			; Save the speed index
	cmp r1, r0		; Which way is the dash going?
	jgr box_beyond_add	; Right or down: beyond = next + speed
	sub r3, r1, r2		; Left or up: beyond = next - speed
	jmp box_beyond_ok
	box_beyond_add:
	add r3, r1, r2		; Right or down: beyond = next + speed
	box_beyond_ok:
	loadn r4, #map
	add r4, r4, r3		; r4 = address of the tile beyond
	loadi r6, r4		; r6 = tile beyond the box
	loadn r7, #' '
	cmp r6, r7		; empty tile: the box slides
	jeq push_box
	loadn r7, #'{'
	cmp r6, r7		; trap: the box covers it
	jeq push_box
	loadn r7, #'@'
	cmp r6, r7		; plate: the box presses it
	jeq push_box
	
	pop r3			; Restore the speed index
	loadn r6, #0
	call print_player
	jmp read_direction	; The box is blocked, stop the dash
	
	push_box:
	loadn r7, #'#'
	storei r4, r7		; Move the crate one tile ahead
	loadn r4, #'@'
	cmp r6, r4		; Was the box pushed onto a plate?
	jeq push_box_switch
	push_box_draw:
	loadn r7, #'#'
	loadn r6, #256		; Crate color
	add r7, r7, r6
	outchar r7, r3		; Draw the box in its new tile
	pop r3			; Restore the speed index
	call move_player
	push r5
	rts			; Keep the dash moving
	
	push_box_switch:
	call open_switch_door
	jmp push_box_draw
	; ────────────────────────────────────────
	
	no_box_hit:
	; ────┤ Key: pick it up ├────
	loadn r4, #'$'
	cmp r6, r4
	jne no_key_hit
	
	call update_keys
	call move_player
	push r5
	rts			; Keep the dash moving
	; ────────────────────────────────────────
	
	no_key_hit:
	; ────┤ Bomb: add one bomb ├────
	loadn r4, #'&'
	cmp r6, r4
	jne no_bomb_hit
	
	load r4, bomb_count
	inc r4
	store bomb_count, r4
	call draw_hud
	call move_player
	push r5
	rts			; Keep the dash moving
	; ────────────────────────────────────────
	
	no_bomb_hit:
	; ────┤ Shield: absorb one trap hit ├────
	loadn r4, #'^'
	cmp r6, r4
	jne no_shield_hit
	
	; Already shielded? The pickup pays bonus coins instead of being wasted
	load r4, shield
	loadn r7, #0
	cmp r4, r7
	jeq shield_first
	load r4, coin_count
	loadn r7, #5
	add r4, r4, r7
	store coin_count, r4
	call move_player	; take the tile while r0/r1 are still the move registers
	call draw_hud
	loadn r1, #msg_shield_bonus
	call show_message
	push r5
	rts			; Keep the dash moving
	
	shield_first:
	loadn r4, #1
	store shield, r4
	call draw_hud
	call move_player
	push r5
	rts			; Keep the dash moving
	; ────────────────────────────────────────
	
	no_shield_hit:
	; ────┤ Lever: flip the layout tiles ├────
	loadn r4, #'<'
	cmp r6, r4
	jne no_lever_hit
	
	call flip_layout
	call move_player
	push r5
	rts			; Keep the dash moving
	; ────────────────────────────────────────
	
	no_lever_hit:
	; ────┤ Door: open with a key ├────
	loadn r4, #'='
	cmp r6, r4
	jne no_door_hit
	
	load r4, key_count
	loadn r7, #0
	cmp r4, r7
	jeq door_stop		; No key in hand, the door holds
	
	; Erase the door from the map and the screen
	loadn r3, #map
	add r3, r3, r1
	loadn r4, #' '
	storei r3, r4
	outchar r4, r1
	
	; Spend the key and show the new count
	load r4, key_count
	dec r4
	store key_count, r4
	call draw_hud
	
	door_stop:
	loadn r6, #0
	call print_player
	jmp read_direction
	; ────────────────────────────────────────
	
	no_door_hit:
	; ────┤ Switch: press it ├────
	loadn r4, #'@'
	cmp r6, r4
	jne no_switch_hit
	
	call open_switch_door
	call move_player
	push r5
	rts			; Keep the dash moving
	; ────────────────────────────────────────
	
	no_switch_hit:
	; ────┤ Switch door: closed until the switch is pressed ├────
	loadn r4, #'%'
	cmp r6, r4
	jne no_gate_hit
	loadn r6, #0
	call print_player
	jmp read_direction
	; ────────────────────────────────────────
	
	no_gate_hit:
	; ────┤ Solid tiles: stop the dash ├────
	loadn r4, #'}'
	cmp r6, r4
	jeq wall_stop
	loadn r4, #'|'
	cmp r6, r4
	jeq wall_stop
	loadn r4, #'!'
	cmp r6, r4
	jeq wall_stop
	jmp no_wall_hit
	
	wall_stop:
	loadn r6, #0
	call print_player
	jmp read_direction
	
	no_wall_hit:
	; ────┤ Trap: a shield absorbs one hit ├────
	loadn r4, #'{'
	cmp r6, r4
	jne no_trap_hit
	load r4, shield
	loadn r7, #0
	cmp r4, r7
	jeq trap_death		; No shield, the run ends here
	
	; The shield absorbs the hit and the trap is removed
	push r3			; Keep the speed index
	loadn r3, #map
	add r3, r3, r1
	loadn r4, #' '
	storei r3, r4
	outchar r4, r1
	loadn r4, #0
	store shield, r4
	call draw_hud
	pop r3			; Restore the speed index
	call move_player
	push r5
	rts			; Keep the dash moving
	
	trap_death:
	loadn r1, #msg_trap
	call show_message
	loadn r6, #25
	trap_pause:
	call delay_clock
	dec r6
	jnz trap_pause
	load r5, game_mode
	loadn r6, #2
	cmp r5, r6
	jeq game_over_screen
	call restart_level
	jmp read_direction
	
	no_trap_hit:
	; ────┤ Unknown tile: hold like a wall ├────
	loadn r6, #0
	call print_player
	jmp read_direction

; ────────────┤ Reached the boundary exit: clear the level ├────────────
exit_reached:
	call move_player	; step into the opening
	; ────┤ Level clear: congratulate, scroll to the next room ├────
level_clear_sequence:
	push r6
	push r7
	loadn r1, #msg_clear
	call show_message
	loadn r6, #12		; short pause before the transition
	clear_pause:
	call delay_clock
	dec r6
	jnz clear_pause
	load r5, game_mode
	loadn r6, #2
	cmp r5, r6
	jeq clear_endless
	load r6, level_index
	inc r6
	store level_index, r6
	loadn r7, #5
	cmp r6, r7
	jeq all_levels_done
	call scroll_to_next_level
	pop r7
	pop r6
	call start_level
	jmp read_direction

	clear_endless:
	load r6, endless_depth
	inc r6
	store endless_depth, r6
	call compute_entry_side
	call generate_room
	call scroll_to_next_level
	pop r7
	pop r6
	call enter_room
	jmp read_direction
	
	all_levels_done:
	loadn r1, #msg_win
	call show_message
	win_wait:
	loadn r2, #13
	inchar r1
	cmp r1, r2
	jne win_wait
	pop r7
	pop r6
	jmp main

; ────────────┤ Scrolls the next room into view ├────────────
; The camera follows the player out of the exit: after a top exit the next
; room slides in from the top, after a side exit from the side.
scroll_to_next_level:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	load r5, game_mode
	loadn r6, #2
	cmp r5, r6
	jeq scroll_source_buffer
	call pick_level_data	; r1 = next level string (level_index already moved on)
	jmp scroll_source_ready
	scroll_source_buffer:
	loadn r1, #room_buf
	scroll_source_ready:
	mov r7, r1		; r7 = next room data
	load r5, exit_pos
	loadn r6, #40
	cmp r5, r6
	jle scroll_up_next	; exit on the top row -> slide from the top
	mod r5, r5, r6		; column of the exit cell
	loadn r6, #0
	cmp r5, r6
	jeq scroll_left_next	; exited left, the map slides right
	jmp scroll_right_next	; exited right, the map slides left
scroll_up_next:
	loadn r5, #0		; r5 = cells already scrolled in (0..1200)
	scroll_up_step:
	loadn r6, #40
	add r5, r5, r6		; one more row
	; the old room slides up
	loadn r2, #scroll_buf
	loadn r3, #map
	add r3, r3, r5
	loadn r6, #1200
	sub r6, r6, r5
	call scroll_copy
	; the next room enters from the bottom of the screen
	mov r3, r7
	mov r6, r5
	call scroll_copy
	loadn r3, #0
	storei r2, r3		; string terminator
	loadn r0, #0
	loadn r1, #scroll_buf
	call print_string
	call delay_clock
	loadn r6, #1200
	cmp r5, r6
	jne scroll_up_step
	jmp scroll_done
	
scroll_left_next:
	loadn r5, #0		; r5 = columns already scrolled in (0..40)
	scroll_left_step:
	loadn r6, #1
	add r5, r5, r6
	loadn r0, #0		; r0 = row
	scroll_left_row:
	loadn r1, #40
	mul r4, r0, r1		; r4 = 40 * row, scroll_copy does not clobber r4
	loadn r2, #scroll_buf
	add r2, r2, r4		; destination row
	loadn r3, #40
	sub r3, r3, r5
	add r3, r3, r4
	add r3, r3, r7		; the next room part of this row
	mov r6, r5
	call scroll_copy
	loadn r3, #map
	add r3, r3, r4
	loadn r6, #40
	sub r6, r6, r5
	call scroll_copy	; the old room part of this row
	inc r0
	loadn r1, #30
	cmp r0, r1
	jne scroll_left_row
	loadn r3, #0
	storei r2, r3		; string terminator
	loadn r0, #0
	loadn r1, #scroll_buf
	call print_string
	call delay_clock
	loadn r1, #40
	cmp r5, r1
	jne scroll_left_step
	jmp scroll_done

; ────────────┤ Slides the next room in from the right ├────────────
scroll_right_next:
	loadn r5, #0		; r5 = columns already scrolled in (0..40)
	scroll_right_step:
	loadn r6, #1
	add r5, r5, r6
	loadn r0, #0		; r0 = row
	scroll_right_row:
	loadn r1, #40
	mul r4, r0, r1		; r4 = 40 * row
	loadn r2, #scroll_buf
	add r2, r2, r4		; destination row
	loadn r3, #map
	add r3, r3, r4
	add r3, r3, r5		; the old room part of this row
	loadn r6, #40
	sub r6, r6, r5
	call scroll_copy
	mov r3, r7
	add r3, r3, r4		; the next room part enters on the right
	mov r6, r5
	call scroll_copy
	inc r0
	loadn r1, #30
	cmp r0, r1
	jne scroll_right_row
	loadn r3, #0
	storei r2, r3		; string terminator
	loadn r0, #0
	loadn r1, #scroll_buf
	call print_string
	call delay_clock
	loadn r1, #40
	cmp r5, r1
	jne scroll_right_step
	jmp scroll_done
	
scroll_done:
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; ────────────┤ Copies r6 cells from r3 to r2 ├────────────
scroll_copy:
	loadn r1, #0
	cmp r6, r1
	jeq scroll_copy_end
	scroll_copy_loop:
	loadi r1, r3
	storei r2, r1
	inc r2
	inc r3
	dec r6
	jnz scroll_copy_loop
	scroll_copy_end:
	rts

; ────────────┤ End of collision logic ├────────────

; ────────────┤ Movement ├────────────
; r0 = current_pos | r1 = next_pos
move_player:
	push r2
	push r3
	
	; ────┤ Erasing the player from the current position ├────
	loadn r2, #' '
	outchar r2, r0	; Erase the player from map[r0]
	; ──────────────────────────────────────────
	
	; ────┤ Update and print the player at the next position ├────
	mov r0, r1		; r0 = next_pos
	loadn r3, #map	; r3 = end(map)
	add r1, r0, r3	; r1 = end(map[next_pos])
	storei r1, r2	; Erase whatever is in the next position
	call print_player
	; ───────────────────────────────────────────────────
	
	call delay_clock
	pop r3
	pop r2
	rts

; ────────┤ End of movement ├────────

; ────────────┤ Help overlay (H or Tab) ├────────────
; r0 holds the player position on entry and is preserved
help_screen:
	push r0
	push r1
	push r2
	loadn r0, #0
	loadn r1, #help_art
	call print_string
	help_wait:
	inchar r1
	loadn r2, #'h'
	cmp r1, r2
	jeq help_close
	loadn r2, #'H'
	cmp r1, r2
	jeq help_close
	loadn r2, #9
	cmp r1, r2
	jeq help_close
	loadn r2, #13
	cmp r1, r2
	jeq help_close
	jmp help_wait
	help_close:
	loadn r0, #0
	loadn r1, #map
	call print_string
	pop r2
	pop r1
	pop r0			; recover the player position
	call print_player
	call draw_hud
	loadn r1, #msg_blank
	call show_message
	rts

; ────────────┤ General utilities ├────────────
; r0 = screen position | r1 = string address | r2 = string color
print_string:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	
	loadn r3, #'\0'		; Stop condition for the string print
	loadn r6, #sprite_colors
	
print_string_loop:
	loadi r4, r1	; r4 = sprite  | sprite = string[i]
	cmp r4, r3		; sprite == '\0' -> finished printing
	jeq print_string_end
	
	
	loadn r5, #'*'
	cmp r4, r5		; sprite = coin
	loadn r2, #0
	jeq print_sprite
	
	loadn r5, #'}'
	cmp r4, r5		; sprite = normal wall
	loadn r2, #1
	jeq print_sprite
	
	loadn r5, #'{'
	cmp r4, r5		; sprite = deadly wall
	loadn r2, #2
	jeq print_sprite
	
	loadn r5, #')'
	cmp r4, r5		; sprite = flag
	loadn r2, #3
	jeq print_sprite
	
	loadn r5, #'#'
	cmp r4, r5		; sprite = crate
	loadn r2, #5
	jeq print_sprite
	
	loadn r5, #'$'
	cmp r4, r5		; sprite = key
	loadn r2, #6
	jeq print_sprite
	
	loadn r5, #'='
	cmp r4, r5		; sprite = door
	loadn r2, #7
	jeq print_sprite
	
	loadn r5, #'@'
	cmp r4, r5		; sprite = plate
	loadn r2, #8
	jeq print_sprite
	
	loadn r5, #'%'
	cmp r4, r5		; sprite = gate
	loadn r2, #9
	jeq print_sprite
	
	loadn r5, #'<'
	cmp r4, r5		; sprite = lever
	loadn r2, #10
	jeq print_sprite
	
	loadn r5, #'&'
	cmp r4, r5		; sprite = bomb
	loadn r2, #11
	jeq print_sprite
	
	loadn r5, #'^'
	cmp r4, r5		; sprite = shield
	loadn r2, #12
	jeq print_sprite
	
	loadn r5, #'|'
	cmp r4, r5		; sprite = breakable wall
	loadn r2, #13
	jeq print_sprite
	
	loadn r5, #'!'
	cmp r4, r5		; sprite = toggle wall
	loadn r2, #14
	jeq print_sprite
	
	loadn r2, #4
	
	print_sprite:
	add r2, r2, r6	; sprite_color = end(sprite_colors[sprite])
	loadi r2, r2	; sprite_color = sprite_colors[sprite]
	add r4, r2, r4	; sprite + sprite_color
	outchar r4, r0
	
	inc r0	; pos++
	inc r1	; i++ (string[i])
	jmp print_string_loop

print_string_end:
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

; r0 = player position
print_player:
	push r1
	push r2
	
	loadn r1, #'z'	; r1 = player
	loadn r2, #768	; Player color
	add r1, r1, r2
	outchar r1, r0	; Print the player at map[r0]

	pop r2
	pop r1
	rts

update_coins:
	push r2
	load r2, coin_count
	inc r2
	store coin_count, r2
	pop r2
	call draw_hud
	rts

update_keys:
	push r2
	load r2, key_count
	inc r2
	store key_count, r2
	pop r2
	call draw_hud
	rts

; Opens every gate in the working map, called when a plate is pressed
open_switch_door:
	push r1
	push r2
	push r3
	push r4
	push r5
	
	loadn r1, #map
	loadn r2, #1200
	open_switch_door_loop:
	loadi r3, r1
	loadn r4, #'%'
	cmp r3, r4
	jne open_switch_door_skip
	loadn r4, #' '
	storei r1, r4		; The gate opens in the map
	loadn r5, #map
	sub r3, r1, r5		; Screen position of this gate
	outchar r4, r3		; The gate is erased on the screen
	open_switch_door_skip:
	inc r1
	dec r2
	jnz open_switch_door_loop
	
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	rts


; Delay function: keeps the clock busy to pace the dash animation.
; The per-tile length is the tuning knob: loop_count * nops_per_loop rounds.
delay_clock:
	push r0
	push r1
	push r2
	
	load r0, loop_count	; number of loops
	loadn r2, #0
	
	delay_loop:
	load r1, nops_per_loop	; number of nops
	dec r0
	delay_nop:	; runs (n_loops * n_nops) times
	nop
	dec r1
	cmp r1, r2
	jne delay_nop
	
	cmp r0, r2
	jne delay_loop
	
	pop r2
	pop r1
	pop r0
	rts
