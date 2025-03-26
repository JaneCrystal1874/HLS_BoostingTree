-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Ee0_rom is 
    generic(
             DWIDTH     : integer := 32; 
             AWIDTH     : integer := 9; 
             MEM_SIZE    : integer := 512
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_Ee0_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111100111110011001111001010010", 
    1 => "00111110000101100000000011110011", 
    2 => "00111101000000001001110000111101", 
    3 => "00111110000001101000001101111111", 
    4 => "00111110001001111110001010000010", 
    5 => "10111111101110000010001001101000", 
    6 => "00111101110111000100101010000100", 
    7 => "00111101101101011101011001111100", 
    8 => "00111101110010101011100000100000", 
    9 => "10111111100100101010000001100110", 
    10 => "00111110101010101101011101110011", 
    11 => "00111101100100100000011101001111", 
    12 => "00111101111010111010000001100010", 
    13 => "00111101100101110001111110111100", 
    14 => "00111100010110111011000101101100", 
    15 => "00111111011111100011101101111001", 
    16 => "01000000000001000101101000110110", 
    17 => "00111111001111001011001101110000", 
    18 => "00111101101110111111101011010011", 
    19 => "00111111100111010111101010000001", 
    20 => "00111101111100011010001100101011", 
    21 => "00111110110111100110100001011110", 
    22 => "00111111011001000100000001101100", 
    23 => "00111111000101010001101011101011", 
    24 => "10111110110111010011100100110010", 
    25 => "00111111001001111101000110001001", 
    26 => "10111110010101011100100101100000", 
    27 => "10111110101001000011011100111111", 
    28 => "10111111110100111010101101001011", 
    29 => "10111111011100101011001011100001", 
    30 => "00111011011100111010100110110000", 
    31 => "00000000000000000000000000000000", 
    32 => "00111101010111001100110010001010", 
    33 => "10111111001110101011101101100110", 
    34 => "00111111000010001101010111111010", 
    35 => "00111111000001111010000101101110", 
    36 => "00111111000010110010100110010001", 
    37 => "00111111000001000010110011000011", 
    38 => "01000000001010010011010000000001", 
    39 => "10111111100010011000001010100001", 
    40 => "00111110100111101110100111011101", 
    41 => "00111110111110110101100001101101", 
    42 => "00111111000001011101001010011110", 
    43 => "00111110011011011011111101001000", 
    44 => "10111111010001010111111111111010", 
    45 => "00111111001001000000101101100111", 
    46 => "00111110010001010101000011001010", 
    47 => "10111110110110111010001000010110", 
    48 => "10111111011111100100111100010010", 
    49 => "00111111001101110110110000110111", 
    50 => "00111111001111110101011100011101", 
    51 => "00111111001000011111010000101100", 
    52 => "00111111001010000001111001111001", 
    53 => "10111110001011111000110110110101", 
    54 => "00111111100101101001110011110101", 
    55 => "10111111011000111111101010001111", 
    56 => "10111101011100000111001110011011", 
    57 => "00111111011011000011010001111111", 
    58 => "00111101111110110101110110001001", 
    59 => "00111011101000000010001100100001", 
    60 => "00111111101000000001011001100001", 
    61 => "10111111010111011100101111111111", 
    62 => "00111101110110001101111001101110", 
    63 => "00000000000000000000000000000000", 
    64 => "00111101111101010001001111111001", 
    65 => "00111101111100111001100101110000", 
    66 => "00111101111110000000111011010000", 
    67 => "00111110010000111000011111011111", 
    68 => "00111111110111000011110100101110", 
    69 => "10111111101111001101101011110101", 
    70 => "00111101100010000001110100111011", 
    71 => "00111110001100100001001011010111", 
    72 => "00111110011000010001101011011010", 
    73 => "10111111010011001111000110000000", 
    74 => "00111100101001011000011100001110", 
    75 => "00111111010001110100001000000011", 
    76 => "00111101101011000101010101000011", 
    77 => "00111110010110100110101010000111", 
    78 => "00111110011101011000011011001011", 
    79 => "00111110000010100001111111010001", 
    80 => "00111101111010011011100111011000", 
    81 => "00111101110011011110001010101100", 
    82 => "10111111010010101001010001010111", 
    83 => "10111111101100100011010000011010", 
    84 => "10111110011001001011010001001010", 
    85 => "00111110010011011110101000000011", 
    86 => "01000000001011011111011100111100", 
    87 => "10111111110100000101011010010011", 
    88 => "00111101000110111111001101111100", 
    89 => "00111111110000001111110011000110", 
    90 => "10111110010101011010011011000110", 
    91 => "10111111010010100100111001111011", 
    92 => "00111010100111000011110011100010", 
    93 => "00111111101000100101110000011100", 
    94 => "10111111000110110110011100011011", 
    95 => "00000000000000000000000000000000", 
    96 => "00111101000100100011010011101100", 
    97 => "00111100110001001010110001101101", 
    98 => "00111101000111100011000100001110", 
    99 => "00111110100100100001101010110101", 
    100 => "00111111011010100010110110100101", 
    101 => "10111111100011000111110010011110", 
    102 => "00111110010001001101111000111100", 
    103 => "00111110001100110011101110010111", 
    104 => "00111110010100100001101100111011", 
    105 => "00111101100111111110001000011110", 
    106 => "00111101111001110111011100001000", 
    107 => "00111101100100100100100101011110", 
    108 => "00111101100000111000000000000010", 
    109 => "00111110001010011010001110010000", 
    110 => "00111101101001100111001001110101", 
    111 => "00111101101111110101000011100011", 
    112 => "00111111010000011111101010111001", 
    113 => "10111111000100111000000011011100", 
    114 => "10111111111100010001011000001001", 
    115 => "00111111010000001100100000100110", 
    116 => "00111110100011101011001110011010", 
    117 => "00111101000101010000001100110010", 
    118 => "00111111100001001001101100010111", 
    119 => "10111111111011110001001000001010", 
    120 => "10111101111000000111111101100111", 
    121 => "00111111011000101011101111001011", 
    122 => "10111111011100110110001010010101", 
    123 => "00111111001001101111011100011010", 
    124 => "01000000000011111111011011100100", 
    125 => "10111110100111001111001101110111", 
    126 => "00111100000110010101101010101111", 
    127 => "00000000000000000000000000000000", 
    128 => "00111101111111101111100011001111", 
    129 => "00111101100010111010011000100110", 
    130 => "00111110000000110011111010111100", 
    131 => "00111111010010011110010110011111", 
    132 => "00111101100101111110110000110101", 
    133 => "00111110000000001110011001101101", 
    134 => "00111101001011110110100101000100", 
    135 => "00111101100000111110100111101010", 
    136 => "00111111000011101111110101010100", 
    137 => "00111111111011010010110111111101", 
    138 => "00111111010001000011011110100100", 
    139 => "10111110101111011110010010100100", 
    140 => "10111111101011111111001110010101", 
    141 => "00111111010001001001111001010110", 
    142 => "00111110000010100011011000011010", 
    143 => "00111101101111001010010010110001", 
    144 => "10111101110010000101011111110011", 
    145 => "00111101001000111100100001011100", 
    146 => "00111110001010011011000000100101", 
    147 => "00111111001111110101011100011101", 
    148 => "00111110000111001001110110011101", 
    149 => "10111101110110101100010001110010", 
    150 => "00111111010100110010011000101001", 
    151 => "10111110110011000001011101100101", 
    152 => "10111111111101000110000010101010", 
    153 => "00111111101011000001001110101001", 
    154 => "00111110001000000111001100010101", 
    155 => "11000000000110010011000001001001", 
    156 => "00111110100000111111110010000111", 
    157 => "00111111001111110010001111101110", 
    158 => "00111011101111100100000001000010", 
    159 => "00000000000000000000000000000000", 
    160 => "00111110101010111000101111110000", 
    161 => "00111110010010001001001110111000", 
    162 => "00111101100010001101110010011000", 
    163 => "00111110010101101011011000010111", 
    164 => "00111111010111001000100000101111", 
    165 => "00111101100000010100001101111100", 
    166 => "00111101101111000100010101000110", 
    167 => "00111110100011011111111010010111", 
    168 => "00111111010000011111101010111001", 
    169 => "00111110101100100000000110101100", 
    170 => "00111101110010111100011110110100", 
    171 => "00111101011110100001000110101001", 
    172 => "00111111011010010001001010111010", 
    173 => "00111111110010000000111101101111", 
    174 => "10111111001001000101001100101010", 
    175 => "00111110001101111100101011101010", 
    176 => "10111111101000000101001000000101", 
    177 => "00111111010001001001111001010110", 
    178 => "00111101110011011101111110000111", 
    179 => "00111101000011010001010000011010", 
    180 => "10111111001110011110000110110001", 
    181 => "00111101100111011011100110000100", 
    182 => "00111110101101100100000101001110", 
    183 => "00111110100111111110011001001111", 
    184 => "01000000000000010111010111001001", 
    185 => "10111111100101000110000110000100", 
    186 => "00111110001011110101010001001100", 
    187 => "10111111100011101110100100101101", 
    188 => "10111110100010000000100001100011", 
    189 => "00111111001011101011010111100101", 
    190 => "10111101000010110100000001110000", 
    191 => "00000000000000000000000000000000", 
    192 => "00111111010101011100010111111000", 
    193 => "00111111001111110101011100011101", 
    194 => "01000000100001010000111100000010", 
    195 => "00111101000010101101011010001000", 
    196 => "00111101001110111101001110000000", 
    197 => "00111100110011111000110101110001", 
    198 => "00111110000000000100111010100101", 
    199 => "01000000010010011001011101010111", 
    200 => "00111101011100001001011000110101", 
    201 => "00111100100100101100110011110111", 
    202 => "01000000100101111011001011001111", 
    203 => "00111101100000011110000111010010", 
    204 => "00111111001101010010101111110101", 
    205 => "11000000010011000111101110101111", 
    206 => "00111101101010100111101011001000", 
    207 => "01000000000100110111111000110001", 
    208 => "10111111111000010101101110001010", 
    209 => "11000000001010000000100111000000", 
    210 => "10111111100010010100010000000011", 
    211 => "00111110110010101110011100001100", 
    212 => "00111110101000110100110100100111", 
    213 => "00111101101011011110000100011010", 
    214 => "00111110001011001111000011111010", 
    215 => "10111110001101101101010101001001", 
    216 => "10111111101001111000110101101001", 
    217 => "00111110001101101101101011001011", 
    218 => "01000000101000110010001111110010", 
    219 => "10111111110011010011010100110011", 
    220 => "10111101011101011111001011001011", 
    221 => "01000000100010111101110001000000", 
    222 => "00111110101001011011110100110000", 
    223 => "00000000000000000000000000000000", 
    224 => "00111110111110101011100011000111", 
    225 => "00111110100110111011011000100100", 
    226 => "00111111000111111011111111000110", 
    227 => "00111110001100000011100110101100", 
    228 => "00111101100000101101010100010111", 
    229 => "00111110111000110110110111101100", 
    230 => "00111110001111011010011101101110", 
    231 => "10111110010110000101101101011011", 
    232 => "00111101111001000001111001011000", 
    233 => "00111110110111101101101001000101", 
    234 => "00111110111101011100101111111111", 
    235 => "00111111010001000110110100011110", 
    236 => "10111111011000100101001100100010", 
    237 => "10111111100000000011011101101001", 
    238 => "10111110110011111111101110101101", 
    239 => "00111110110110100010011001011111", 
    240 => "10111111001111010001101011101011", 
    241 => "00111110011000101111111011000101", 
    242 => "00111110111111101000110110111001", 
    243 => "10111110110111011001101110100010", 
    244 => "00111111001011111101100101100110", 
    245 => "00111111001001100101001111111100", 
    246 => "00111111011100000010001010011010", 
    247 => "00111111101110111110101101011011", 
    248 => "00111110100101101000000110101010", 
    249 => "10111111000110011110110011100101", 
    250 => "00111101110011001000101010111101", 
    251 => "00111100100101110000110101100011", 
    252 => "10111110100001010010100111111110", 
    253 => "10111110101111100010100010101010", 
    254 => "00111111001101000011110110011011", 
    255 => "00000000000000000000000000000000", 
    256 => "00111110111110000011101110100011", 
    257 => "00111110100100011011001011000100", 
    258 => "00111110111111001100000101100110", 
    259 => "00111110011010101001100000100100", 
    260 => "00111110100011101001110010101010", 
    261 => "00111111110110101111011100101011", 
    262 => "00111111000000100110101010111010", 
    263 => "00111110010110101010100001100101", 
    264 => "00111110110101000011101010000110", 
    265 => "11000000000010001001000011001101", 
    266 => "00111110111010001111001101100111", 
    267 => "10111111100000000000101011100001", 
    268 => "00111111000010010001011001010101", 
    269 => "00111111010001001001111001010110", 
    270 => "10111111110101101011101000010111", 
    271 => "10111110110001100111000011000001", 
    272 => "00111110110111111010010001000000", 
    273 => "00111110100101110001011011110100", 
    274 => "10111111010111001011111001000000", 
    275 => "00111110100010011001100011110010", 
    276 => "00111101101111111111011100010110", 
    277 => "00111101011100010111110111110010", 
    278 => "00111101111000000100011111010100", 
    279 => "00111111111010000000110000001111", 
    280 => "00111111011011110010111000100111", 
    281 => "01000000000000001100001000011010", 
    282 => "10111110000110010101010001100101", 
    283 => "10111111001000100101100010100011", 
    284 => "00111100110110011011111001001101", 
    285 => "10111101000100011000111100111111", 
    286 => "10111111110110001011000010010110", 
    287 => "00000000000000000000000000000000", 
    288 => "00111101100001011011010000100100", 
    289 => "00111110000000101000010101100110", 
    290 => "00111110001111110010000011101010", 
    291 => "00111101001110111101001110000000", 
    292 => "00111110010111010011001101001100", 
    293 => "00111110100000110101000111011111", 
    294 => "00111110001111111111110010011000", 
    295 => "10111111000100011101001000011000", 
    296 => "00111101000110100101101110010110", 
    297 => "00111110000101011011010000100100", 
    298 => "00111111100101110101001111100111", 
    299 => "00111110000000010110101110011000", 
    300 => "00111110100011100100001001011011", 
    301 => "00111111100111010010000011001001", 
    302 => "00111111001111001011001101110000", 
    303 => "10111110111000011011101010100001", 
    304 => "00111101100010110000010100110010", 
    305 => "00111111000111110011011101110110", 
    306 => "10111111001101100101011111011010", 
    307 => "10111101100001101110110100100100", 
    308 => "00111111101010010100111110110101", 
    309 => "10111111111010011100001100001101", 
    310 => "00111101101001000000010010100111", 
    311 => "00111110010100001111010101011110", 
    312 => "00111110010001001111001110111010", 
    313 => "00111111011011110101110001101100", 
    314 => "10111110001010001110011000001000", 
    315 => "00111111011000001011011100011100", 
    316 => "00111101011100110110001101101111", 
    317 => "10111111011011100000100000101001", 
    318 => "10111100101110000101101001001111", 
    319 => "00000000000000000000000000000000", 
    320 => "00111111001100111000100011101100", 
    321 => "00111111001011000111010011101011", 
    322 => "00111111001101010010101111110101", 
    323 => "00111111001010111110101011110111", 
    324 => "00111110101000001100100101110101", 
    325 => "00111110110100000110101000101011", 
    326 => "00111111001101100001000111101101", 
    327 => "00111111000110111000000010001000", 
    328 => "10111111001110001001001110000110", 
    329 => "00111110100001000111110111100101", 
    330 => "00111110110011011010110101110101", 
    331 => "10111110100000111000000010001000", 
    332 => "10111111110001001001001111100010", 
    333 => "00111111011001001100001110001111", 
    334 => "00111111001101110110110000110111", 
    335 => "00111111000110011010100001111010", 
    336 => "00111110101111100110001100100000", 
    337 => "00111110110111010110000011101001", 
    338 => "10111111101101011101101000011111", 
    339 => "00111111101110001011010100110101", 
    340 => "00111110111111011111001110010101", 
    341 => "10111111001011001101111100010110", 
    342 => "00111111001110001001101111111010", 
    343 => "00111100100000000000100001100011", 
    344 => "00111111100000110100101110111110", 
    345 => "10111101010010010000100000011100", 
    346 => "10111111011000000011100100100110", 
    347 => "10111110100000011110001000010101", 
    348 => "00111111001010101111000110111011", 
    349 => "10111111001110011111010010000000", 
    350 => "00111101110011110011011111111100", 
    351 => "00000000000000000000000000000000", 
    352 => "00111111000100001010000001111111", 
    353 => "00111110111010111100100011000001", 
    354 => "00111111001001101010101000101010", 
    355 => "00111110100100000100101110100001", 
    356 => "00111111000011100110101000100011", 
    357 => "00111110100000010001110111011110", 
    358 => "00111111010000011111101010111001", 
    359 => "10111111011001101011101010011101", 
    360 => "10111110100100111001000100001100", 
    361 => "00111110011111110101101101100000", 
    362 => "00111110101110010111100011010101", 
    363 => "00111110100111010110110001010001", 
    364 => "00111111000111011010110000100110", 
    365 => "00111110101000101111101100011010", 
    366 => "00111111011001000001100001000000", 
    367 => "00111111101010111100001010100000", 
    368 => "00111110100010000011101010010111", 
    369 => "00111111001111001011001101110000", 
    370 => "00111110100111101011100010110111", 
    371 => "00111110101001100110111010000111", 
    372 => "10111110010111111011011000010011", 
    373 => "10111101001111011101111111001010", 
    374 => "00111101111011100110010110111111", 
    375 => "10111111010111101100101101000011", 
    376 => "10111110011110011111010000001010", 
    377 => "00111111001011011010000000000110", 
    378 => "00111101011000000110111010100000", 
    379 => "10111111100100011011010011000100", 
    380 => "10111101011010110001111001011100", 
    381 => "00111110101010001101001000011100", 
    382 => "00111111100010101101100010000000", 
    383 => "00000000000000000000000000000000", 
    384 => "00111100111010110000000100000000", 
    385 => "10111110111101001101011101101011", 
    386 => "00111101000010101101011010001000", 
    387 => "00111101000000001001110000111101", 
    388 => "00111101000100101101001000110101", 
    389 => "00111100111110011001111001010010", 
    390 => "00111101000001100101010000001101", 
    391 => "10111111011011111100110001011100", 
    392 => "00111101011100000101110110010110", 
    393 => "00111101101010101001110101100010", 
    394 => "10111111000111110001011001011101", 
    395 => "00111111100010000111001100111111", 
    396 => "00111110110001010001010101001000", 
    397 => "00111101010110010101000000110011", 
    398 => "00111101100000111001110001010010", 
    399 => "00111101100000011111100001011101", 
    400 => "00111110011001101011011011100001", 
    401 => "00111110001001101000110110111001", 
    402 => "00111111010001001001111001010110", 
    403 => "00111101101011011110010101001011", 
    404 => "00111101100010011101010010010101", 
    405 => "00111110100100110001010100001110", 
    406 => "10111110110111100000001111110111", 
    407 => "00111101101101000011100001001100", 
    408 => "10111110100110101111000110001000", 
    409 => "10111111000011001011100100110100", 
    410 => "00111110100001001011010111111110", 
    411 => "10111110101101000101110001111001", 
    412 => "00111111100100000100010110000000", 
    413 => "10111110110100110001111011000001", 
    414 => "00111100100010111110110101110100", 
    415 => "00000000000000000000000000000000", 
    416 => "00111101100011110000011000101101", 
    417 => "00111111000000000111011111001101", 
    418 => "00111101100101010101101011000000", 
    419 => "00111101111110000111010110010010", 
    420 => "10111111000000011110100010110100", 
    421 => "00111110001100000100111001100010", 
    422 => "00111101100110101101100011100100", 
    423 => "00111101100001000101000100110011", 
    424 => "00111111000010111110000001011001", 
    425 => "10111101110100111011001110100111", 
    426 => "10111111100101010111110100000111", 
    427 => "00111111011111101100110011010101", 
    428 => "00111101100111010011000110111010", 
    429 => "00111110010010110100011110000100", 
    430 => "00111110000010000101011110110000", 
    431 => "00111110011000010000010100011000", 
    432 => "00111111100101000101000011000110", 
    433 => "10111111000010000000101111011101", 
    434 => "00111101101000110010101000000110", 
    435 => "00111101101001110110100101100110", 
    436 => "10111111000001100011011111001110", 
    437 => "00111110011001110001100111111000", 
    438 => "00111111010011111011010001011111", 
    439 => "00111111001101001011100111001011", 
    440 => "00111101101010001011011011011000", 
    441 => "00111101110011000000011010011110", 
    442 => "10111110001100110000000111101011", 
    443 => "10111111000110010111111010101010", 
    444 => "00111101101100001011100011010000", 
    445 => "00111111000101001000010100001010", 
    446 => "10111100011000101100100110001110", 
    447 => "00000000000000000000000000000000", 
    448 => "00111110001011001110011111001101", 
    449 => "00111101101010110111001000111111", 
    450 => "00111110000100000110101010110001", 
    451 => "00111101101000010011011101101101", 
    452 => "00111111010000011111101010111001", 
    453 => "00111110000000100000010000101001", 
    454 => "00111110000101011011010000100100", 
    455 => "00111110000011101011010010100110", 
    456 => "00111111001001101111110000100110", 
    457 => "00111101101111100100011100010011", 
    458 => "00111110010110111111100000110100", 
    459 => "00111110011000101010011110111101", 
    460 => "00111111101101001000100111010010", 
    461 => "10111111111011011111010100011111", 
    462 => "00111110101001000101010010011011", 
    463 => "10111010111111010001100110011100", 
    464 => "00111110000111101101011110000100", 
    465 => "10111110011110010010011110010001", 
    466 => "10111111110101110100011001111000", 
    467 => "00111110010011100001101100001001", 
    468 => "10111110010100111101111111110100", 
    469 => "00111110001001011010101111000001", 
    470 => "00111110001010000110100001110111", 
    471 => "10111110000010101110000110001011", 
    472 => "10111111101100100001100100000001", 
    473 => "00111101110001011010010111111100", 
    474 => "00111111101010100101110110100111", 
    475 => "10111101000010101110001100011101", 
    476 => "00111111110000111101000100000011", 
    477 => "10111111100110100000101001111100", 
    478 => "00111010111011110001001101001001", 
    479 => "00000000000000000000000000000000", 
    480 => "00111110000100100001010100110011", 
    481 => "00111110000100000010000100001000", 
    482 => "00111110000100111001000100001100", 
    483 => "00111111010001110100001000000011", 
    484 => "00111110000111110111011001100000", 
    485 => "10111111100110100100010010011110", 
    486 => "00111110010100011010110101100100", 
    487 => "00111110101000100000101011011001", 
    488 => "00111101111011010101101011100010", 
    489 => "00111101101010111011110000101100", 
    490 => "00111110001011001111101000100111", 
    491 => "00111110001000100011100110100100", 
    492 => "00111110100111001101100111101000", 
    493 => "00111101001000100011100111100111", 
    494 => "10111111000000101110111001100011", 
    495 => "10111111001000010001101100001101", 
    496 => "10111101101101100111101010010110", 
    497 => "00111111011000000100101011101000", 
    498 => "00111111110100001100100100010000", 
    499 => "10111111100100110001110101101001", 
    500 => "00111110110000010001101101100001", 
    501 => "00111101000000001111101110101001", 
    502 => "00111110010101101000010111011011", 
    503 => "10111110101001101101111111000110", 
    504 => "10111100101100000100000000111010", 
    505 => "00111111011010000110100001010101", 
    506 => "00111101110011000010100010110011", 
    507 => "10111110100000010010100110101010", 
    508 => "00111111100010101110001100000100", 
    509 => "10111110011100110001101000001001", 
    510 => "00111111010010010101110001010011", 
    511 => "00000000000000000000000000000000" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_Ee0 is
    generic (
        DataWidth : INTEGER := 32;
        AddressRange : INTEGER := 512;
        AddressWidth : INTEGER := 9);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_Ee0 is
    component predict_ensemble_Ee0_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Ee0_rom_U :  component predict_ensemble_Ee0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


