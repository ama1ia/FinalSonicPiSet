#Final Sonic Pi Set

############### Parameteriized Functions ###############
define :half do |n1, n2|
  play n1
  sleep 0.5
  
  play n2
  sleep 0.5
end

define :twohalf do |n1, n2|
  play n1
  play n2
  sleep 0.5
end

define :twowhole do |n1, n2|
  play n1
  play n2
  sleep 2
end

define :quarter do |n1, n2|
  play n1
  sleep 0.25
  
  play n2
  sleep 0.25
end

define :one do |n1, n2|
  play n1
  sleep 1.5
  
  play n2
  sleep 0.5
  
  play n2
  sleep 2
end

define :chords do |n1, n2, n3|
  2.times do
    play n1, amp: 0.5
    play n2, amp: 0.5
    play n3, amp: 0.5
    ##| play n4
    sleep 1.5
  end
  
  play n1
  play n2
  play n3
  sleep 1
end

define :triplets do |n1, n2, n3|
  play n1
  sleep 0.5
  play n2
  sleep 0.5
  play n3
  sleep 1
end

define :sevenths do |n1, n2|
  3.times do
    play n1
    sleep 0.5
  end
  play n2
  sleep 0.5
end


############### First Song ###############
vocals = "C:/Users/amalia_perez/Desktop/Challenges/The Story/vocaltrythree.wav"
intro = "C:/Users/amalia_perez/Desktop/Challenges/The Story/thestoryintroguitar.wav"
vocalschorus = "C:/Users/amalia_perez/Desktop/Challenges/The Story/vocalschorus.wav"

print sample_duration intro
print sample_duration vocals
print sample_duration vocalschorus

define :melody do
  b = [:E4, :G4, :C5, :G4, :E4]
  i = 0
  3.times do
    play :E3, attack: 0.5, sustain: 1, decay: 0.5, amp: 0.5
    play :G3, attack: 0.5, sustain: 1, decay: 0.5
    play :C4, attack: 0.5, sustain: 1, decay: 0.5
    2.times do
      play b[i]
      sleep 0.5
      i = i+1
      print i
    end
    i = 2
    3.times do
      play b[i]
      sleep 1
      i = i+1
      print i
    end
    if i == 5
      i = 0
    end
    play :F3, attack: 0.5, sustain: 1, decay: 0.5
    play :A3, attack: 0.5, sustain: 1, decay: 0.5
    play :C4, attack: 0.5, sustain: 1, decay: 0.5
    half :F4, :A4
    play :C5, sustain: 1
    sleep 1
  end
end

use_bpm 106.5
use_synth :piano

sample vocals, amp: 2, decay: 3
sleep 19.5

z = 1
y = 4.5
live_loop :guitar do
  15.times do
    print z
    sample intro, amp: 4, rate: 0.75
    sleep 5
    z = z+1
  end
  8.times do
    print z
    sample intro, amp: y, rate: 0.75
    y = y-0.5
    print y
    sleep 5
    z = z+1
  end
  stop
end

melody

play :A4, amp: 0.5, attack: 1 #, sustain: 0.5
2.times do
  sleep 0.5
  play :F3, amp: 0.5, attack: 0.5, sustain: 1, decay: 0.5
  play :A3, attack: 0.5, sustain: 1, decay: 0.5
  play :C4, attack: 0.5, sustain: 1, decay: 0.5
  sevenths :C5, :B4
  half :A4, :G4
  play :E3, attack: 0.5, sustain: 1, decay: 0.5
  play :G3, attack: 0.5, sustain: 1, decay: 0.5
  play :C4, attack: 0.5, sustain: 1, decay: 0.5
  play :E4, attack: 1, sustain: 1, decay: 1
  sleep 0.5
  play :E3, attack: 0.5, sustain: 1, decay: 0.5
  play :G3, attack: 0.5, sustain: 1, decay: 0.5
  play :C4, attack: 0.5, sustain: 1, decay: 0.5
  sleep 1
  2.times do
    half :E4, :G4
  end
  half :G4, :B4
end

play :A4
sleep 4
sample vocalschorus, amp: 4
sleep 65

melody

a = [:E3, :G3, :C4]
a = a
x = 1
live_loop :chord do
  12.times do
    play a, sustain: 2, release: 1, amp: x
    sleep 2
    x= x+0.1
  end
  12.times do
    play a, sustain: 2, release: 1, amp: x
    sleep 2
    x= x-0.15
  end
  stop
end

sleep 8
2.times do
  play :C5
  sleep 1
  play :B4
  sleep 1
  3.times do
    play :A4
    sleep 1
    play :B4
    sleep 1
  end
  play :A4
  sleep 1
  play :G4
  sleep 1
  play :E4, attack: 2, sustain: 2
  sleep 1
  play :E4, attack: 2, sustain: 2
  sleep 2
end

melody

############### Transition ###############

play a, sustain: 2, release: 1
half :E4, :G4
play :C5, sustain: 1
sleep 1
play :G4
sleep 1
play :E4
sleep 1
play :F3, attack: 0.5, sustain: 1, decay: 0.5, amp: 0.5
play :A3, attack: 0.5, sustain: 1, decay: 0.5, amp: 0.5
play :C4, attack: 0.5, sustain: 1, decay: 0.5
#halfs :F4, :A4, amp: 0.5
play :F4, amp: 0.5
sleep 0.5
play :A4, amp: 0.5
sleep 0.5
play :C5, sustain: 1, amp: 0.25
sleep 1
play :A4, amp: 0.5
sleep 1

x = 110
s = 0.75
2.times do
  use_bpm x
  use_synth_defaults amp: s
  half :C4, :D4
  play :E4
  sleep 0.5
  play :D4
  sleep 1.5
  half :C4, :A4
  s = s-0.25
  x = x + 10
  print "s"
end

sample :glitch_bass_g
sleep 2

############### Second Song ###############

intro = "C:/Users/amalia_perez/Desktop/Second song/intro.wav"
snap = "C:/Users/amalia_perez/Desktop/Second song/snap1.wav"
clap = "C:/Users/amalia_perez/Desktop/Second song/Clap sound effect.wav"

print sample_duration intro
print sample_duration :drum_bass_hard

############### Functions ###############
define :chorus do
  C = 3
  sleep 1.5
  play :E4
  sleep 0.5
  play :A4
  play :A3
  sleep 1
  half :G4, :E4
  
  twowhole :A4, :A3
  twowhole :E4, :E3
  
  twowhole :D4, :D3
  half :C4, :D4
  play :E4
  sleep 1
  
  half :E4, :E4
  half :D4, :C4
  triplets :D4, :C4, :C4
  
  play :C4
  sleep 1
  play :E4
  sleep 0.5
  play :A4
  play :A3
  sleep 1.5
  half :G4, :E4
  
  play :A4
  play :A3
  sleep 1.5
  half :E4, :D4
  play :C4
  sleep 0.5
  play :A3
  sleep 1
  
  play :A3
  sleep 2
  half :C4, :D4
  play :E4
  sleep 1
  
  play :E4
  sleep 1
  half :G4, :E4
  triplets :D4, :C4, :C4
  
  play :C4
  sleep 2
  play :A4
  sleep 1
  play :G4
  sleep 1
  half :G4, :A4
  
  twowhole :C5, :C4
  twowhole :A4, :A3
  
  play :E5
  play :E4
  sleep 4.5
  twohalf :E5, :E4
  twohalf :D5, :D4
  twohalf :C5, :C4
  twohalf :D5, :D4
  twohalf :C5, :C4
  
  play :C5
  play :C4
  sleep 3
  
  half :A4, :G4
  half :G4, :E4
  
  play :A4
  play :A3
  sleep 1.5
  half :E4, :D4
  play :C4
  sleep 0.5
  play :A3
  sleep 1
  
  2.times do
    half :C4, :D4
    play :E4
    sleep 0.5
    play :D4
    sleep 1.5
    half :C4, :A4
  end
end


define :bridge do
  sevenths :E5, :G5
  sevenths :D5, :E5
  
  sevenths :C5, :D5
  half :B4, :C5
  half :A4, :G4
  
  play :A4
  sleep 4
end

########## start ##########

use_bpm 140

live_loop :intro do
  sample intro
  stop
end
sleep 16

sample :bd_pure, amp: 2
sleep 1.5

## measure 1 ##
triplets :C5, :B4, :A4

use_synth :dsaw

########## live loops ##########
c = 1

live_loop :drum do
  if c == 5
    stop
  else
    sample :drum_bass_hard, amp: 0.5
    sleep 1
  end
end

time = [4, 6, 3, 5]
t = 0
live_loop :samples do
  if c == 5
    stop
  else
    4.times do
      sample [snap, :ambi_choir, clap].choose
      sleep time[t]
      t = t+1
      print t
    end
    t = 0
  end
end

live_loop :melody do
  a = [ :A4, :C5, :E5]
  a = a
  if c = 1
    print "a"
    4.times do
      chords :D4, :F4, :A4
      chords :G4, :B4, :D4
      chords :C4, :E4, :G4
      2.times do
        play a
        sleep 1
        play :C5
        sleep 1
      end
    end
  end
  if c = 2
    print "b"
    chords :D4, :F4, :A4
    chords :D4, :F4, :Ab4
    chords :C4, :E4, :G4
    2.times do
      play a
      sleep 1
      play :C5
      sleep 1
    end
    chords :D4, :F4, :A4
    chords :Ds4, :Fs4, :A4
    chords :G4, :A4, :D5
  end
  if c = 3
    print "c"
    play :G4
    play :B4
    play :D4
    sleep 4
    4.times do
      chords :A4, :C5, :E5
      chords :D4, :Fs4, :A4
      chords :F4, :A4, :C4
      chords :C4, :E4, :G4
    end
  end
  if c = 4
    print "d"
    sleep 32
    chords :A4, :C5, :E5
    chords :D4, :Fs4, :A4
    chords :F4, :A4, :C4
    chords :C4, :E4, :G4
  end
  if c = 5
    stop
  end
end

## measure 2 ##
one :C5, :D4

## measure 3 ##
sleep 2
triplets :A4, :B4, :A4

## measure 4 ##
play :B4
sleep 0.5
play :E4
sleep 1
play :E4
sleep 1
play :D4
sleep 1
play :E4
sleep 0.5

## measure 5 ##
play :E4
sleep 2
triplets :C5, :B4, :A4

## measure 6 ##
one :C5, :D4

## measure 7 ##
play :C5
sleep 0.5
play :B4
sleep 1
play :A4
sleep 1
half :G4, :E4

## measure 8 ##
play :E4
sleep 4

## measure 9 ##
sleep 2
triplets :C5, :D5, :E5

## measure 10 ##
one :D5, :A4

#measure 11
sleep 2
triplets :B4, :C5, :D5

## measure 12 ##
half :D5, :C5
play :G4
sleep 3

## measure 13 ##
sleep 1
half :A4, :B4
half :C5, :B4
half :A4, :C5

## measure 14 ##
play :C5
sleep 1
half :G4, :A4
half :B4, :A4
half :G4, :B4

## measure 15 ##
play :B4
sleep 1
half :G4, :A4
triplets :B4, :A4, :G4

## measure 16 ##
half :G4, :B4
play :E4
sleep 3

## prechorus ##
sleep 1.5
play :A4
sleep 0.5
triplets :C5, :D5, :E5

c=2

one :D5, :A4

sleep 2
triplets :B4, :C5, :D5

half :D5, :C5
play :G4
sleep 3

sleep 1.5
play :A4
sleep 0.5
triplets :C5, :B4, :A4

play :C5
sleep 2
triplets :C5, :B4, :A4

play :C5
sleep 2
triplets :A4, :B4, :C5

play :C5
sleep 2
twowhole :G5, :G4

c = 3

chorus

c = 4

triplets :E5, :D5, :C5
play :C5
sleep 2.5

bridge
play :A4
sleep 4

bridge

play :A5
sleep 1
play :E5
sleep 1
half :C5, :E4
quarter :G4, :A4
quarter :C5, :D5

bridge

play :A4
sleep 1
quarter :C4, :D4
quarter :E4, :G4
quarter :A4, :C5

bridge

c=3

chorus

s = 0.75
3.times do
  use_synth_defaults amp: s
  half :C4, :D4
  half :E4, :D4
  half :C4, :A4
  s = s-0.25
  print "s"
end

c = 5

############### outro ###############
triplets :E4, :D4, :C4
3.times do
  twohalf :G4, :C4
end
