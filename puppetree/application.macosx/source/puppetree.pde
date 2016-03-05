//int ínt;

int voiceIndex;
int voiceSpeed;

String quotes[];
int quoteLength;
int quoteIndex;

boolean isEngaged;
int counter;
boolean isOpen;

PImage open;
PImage close;

void setup() {
  size(957, 375);
  open = loadImage("DinosaurEvenMoreOpenMouth.png");
  close = loadImage("DinosaurOpenMouth.png");

  quotes = loadStrings("parsedquotes.txt");
  voiceSpeed = 200;
  image(close, 0, 0);
  isOpen = false;
  counter = 0;
}

void keyPressed() {
  isEngaged = true;
  quoteIndex = int(random(quotes.length));
  voiceIndex = int(random(TextToSpeech.voices.length));
  TextToSpeech.say(quotes[quoteIndex], TextToSpeech.voices[voiceIndex], voiceSpeed);
}

void draw() {
  if (isEngaged && (counter < 4 * quotes[quoteIndex].length())) {
    counter++;
    if ((counter % 10 == 0) && isOpen) {
      isOpen = false;
      image(close, 0, 0);
    } else if ((counter % 10 == 0)) {
      isOpen = true;
      image(open, 0, 0);
    }
  } else if (isEngaged) {
    isEngaged = false;
    counter = 0;
    image(close, 0, 0);
  }
}

// Converts a string to speech
static class TextToSpeech extends Object {

  // Stores the voices
  // male voices
  static final String ALEX = "Alex";
  static final String BRUCE = "Bruce";
  static final String FRED = "Fred";
  static final String JUNIOR = "Junior";
  static final String RALPH = "Ralph";

  // female voices
  static final String AGNES = "Agnes";
  static final String KATHY = "Kathy";
  static final String PRINCESS = "Princess";
  static final String VICKI = "Vicki";
  static final String VICTORIA = "Victoria";

  // novelty voices
  static final String ALBERT = "Albert";
  static final String BAD_NEWS = "Bad News";
  static final String BAHH = "Bahh";
  //static final String BELLS = "Bells";
  static final String BOING = "Boing";
  static final String BUBBLES = "Bubbles";
  static final String CELLOS = "Cellos";
  static final String DERANGED = "Deranged";
  static final String GOOD_NEWS = "Good News";
  static final String HYSTERICAL = "Hysterical";
  static final String PIPE_ORGAN = "Pipe Organ";
  static final String TRINOIDS = "Trinoids";
  static final String WHISPER = "Whisper";
  static final String ZARVOX = "Zarvox";

  static String[] voices = {
    ALEX, BRUCE, FRED, JUNIOR, RALPH, AGNES, KATHY, 
    PRINCESS, VICKI, VICTORIA, ALBERT, BAD_NEWS, BAHH, 
  /*BELLS,*/    BOING, BUBBLES, CELLOS, DERANGED, GOOD_NEWS, 
    HYSTERICAL, PIPE_ORGAN, TRINOIDS, WHISPER, ZARVOX
  };

  // Converts string to sound
  static void say(String script, String voice, int speed) {
    try {
      Runtime.getRuntime().exec(new String[] {"say", "-v", voice, "[[rate " + speed + "]]" + script});
    }
    catch (IOException e) {
      System.err.println("IOException");
    }
  }

  // Overload the say method so we can call it with fewer arguments and basic defaults
  static void say(String script) {
    say(script, ALEX, 200);
  }
}