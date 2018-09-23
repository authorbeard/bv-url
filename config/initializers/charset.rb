lc = ("a".."z").to_a
uc = ("A".."Z").to_a
int = (0..9).to_a
extra = %w($ - _ . + ! * ' ( ) ,)

combined = lc << uc << int << extra

BASE_CHARSET = combined.flatten

