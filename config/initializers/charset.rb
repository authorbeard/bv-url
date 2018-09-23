lc = (a..z).to_a
uc = (A..Z).to_a
int = (0..9).to_a
extra = %w($-_.+!*'(),)

BASE_CHARSET = [lc, uc, int, extra].join.flatten