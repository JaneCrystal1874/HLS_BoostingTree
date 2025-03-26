-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Ngs_rom is 
    generic(
             DWIDTH     : integer := 5; 
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


architecture rtl of predict_ensemble_Ngs_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00010", 1 => "00100", 2 => "00110", 3 to 4=> "00000", 5 => "01000", 
    6 => "00000", 7 => "01010", 8 => "01100", 9 => "01110", 10 => "10000", 
    11 => "00000", 12 => "10010", 13 => "10100", 14 => "10110", 15 => "11000", 
    16 => "00000", 17 => "11010", 18 => "11100", 19 to 27=> "00000", 28 => "11110", 
    29 to 31=> "00000", 32 => "00010", 33 => "00100", 34 => "00110", 35 => "01000", 
    36 => "01010", 37 => "01100", 38 => "01110", 39 => "10000", 40 => "00000", 
    41 => "10010", 42 => "10100", 43 => "10110", 44 => "00000", 45 => "11000", 
    46 => "11010", 47 => "00000", 48 => "11100", 49 to 55=> "00000", 56 => "11110", 
    57 to 63=> "00000", 64 => "00010", 65 => "00100", 66 => "00110", 67 => "01000", 
    68 => "00000", 69 => "01010", 70 => "01100", 71 => "01110", 72 => "10000", 
    73 => "00000", 74 => "10010", 75 to 76=> "00000", 77 => "10100", 78 to 79=> "00000", 
    80 => "10110", 81 to 82=> "00000", 83 => "11000", 84 => "11010", 85 => "00000", 
    86 => "11100", 87 => "11110", 88 to 95=> "00000", 96 => "00010", 97 => "00100", 
    98 => "00110", 99 => "01000", 100 => "01010", 101 to 102=> "00000", 103 => "01100", 
    104 => "01110", 105 => "10000", 106 => "00000", 107 => "10010", 108 => "10100", 
    109 to 110=> "00000", 111 => "10110", 112 => "00000", 113 => "11000", 114 => "11010", 
    115 => "11100", 116 to 118=> "00000", 119 => "11110", 120 to 127=> "00000", 128 => "00010", 
    129 => "00100", 130 => "00110", 131 => "01000", 132 => "01010", 133 => "01100", 
    134 => "01110", 135 => "10000", 136 => "10010", 137 => "00000", 138 => "10100", 
    139 => "10110", 140 => "00000", 141 => "11000", 142 to 146=> "00000", 147 => "11010", 
    148 => "11100", 149 to 151=> "00000", 152 => "11110", 153 to 159=> "00000", 160 => "00010", 
    161 => "00100", 162 => "00110", 163 => "01000", 164 => "01010", 165 => "00000", 
    166 => "01100", 167 => "01110", 168 => "10000", 169 => "10010", 170 => "10100", 
    171 => "00000", 172 => "10110", 173 => "00000", 174 => "11000", 175 => "11010", 
    176 => "11100", 177 to 178=> "00000", 179 => "11110", 180 to 191=> "00000", 192 => "00010", 
    193 => "00100", 194 => "00110", 195 => "01000", 196 => "01010", 197 => "01100", 
    198 => "01110", 199 => "10000", 200 to 201=> "00000", 202 => "10010", 203 => "10100", 
    204 to 205=> "00000", 206 => "10110", 207 => "00000", 208 => "11000", 209 to 210=> "00000", 
    211 => "11010", 212 => "00000", 213 => "11100", 214 => "11110", 215 to 223=> "00000", 
    224 => "00010", 225 => "00100", 226 => "00110", 227 => "01000", 228 => "01010", 
    229 => "00000", 230 => "01100", 231 => "01110", 232 => "10000", 233 => "10010", 
    234 => "00000", 235 => "10100", 236 => "10110", 237 to 239=> "00000", 240 => "11000", 
    241 => "11010", 242 => "00000", 243 => "11100", 244 => "11110", 245 to 255=> "00000", 
    256 => "00010", 257 => "00100", 258 => "00000", 259 => "00110", 260 => "01000", 
    261 => "01010", 262 => "01100", 263 => "01110", 264 => "00000", 265 => "10000", 
    266 to 267=> "00000", 268 => "10010", 269 => "10100", 270 to 272=> "00000", 273 => "10110", 
    274 => "11000", 275 => "11010", 276 => "11100", 277 to 279=> "00000", 280 => "11110", 
    281 to 287=> "00000", 288 => "00010", 289 => "00100", 290 => "00110", 291 => "01000", 
    292 => "01010", 293 => "01100", 294 => "01110", 295 => "10000", 296 to 298=> "00000", 
    299 => "10010", 300 => "10100", 301 => "10110", 302 => "11000", 303 to 304=> "00000", 
    305 => "11010", 306 => "11100", 307 to 310=> "00000", 311 => "11110", 312 to 319=> "00000", 
    320 => "00010", 321 => "00100", 322 => "00000", 323 => "00110", 324 => "01000", 
    325 => "01010", 326 => "01100", 327 => "00000", 328 => "01110", 329 => "10000", 
    330 => "10010", 331 => "00000", 332 => "10100", 333 => "10110", 334 => "11000", 
    335 => "11010", 336 to 337=> "00000", 338 => "11100", 339 to 344=> "00000", 345 => "11110", 
    346 to 351=> "00000", 352 => "00010", 353 => "00100", 354 => "00110", 355 => "01000", 
    356 => "00000", 357 => "01010", 358 => "01100", 359 => "01110", 360 => "00000", 
    361 => "10000", 362 => "10010", 363 => "00000", 364 => "10100", 365 => "10110", 
    366 => "00000", 367 => "11000", 368 => "00000", 369 => "11010", 370 => "00000", 
    371 => "11100", 372 => "11110", 373 to 383=> "00000", 384 => "00010", 385 => "00100", 
    386 => "00110", 387 => "01000", 388 => "01010", 389 => "00000", 390 => "01100", 
    391 => "01110", 392 => "10000", 393 => "00000", 394 => "10010", 395 => "00000", 
    396 => "10100", 397 => "00000", 398 => "10110", 399 => "11000", 400 => "11010", 
    401 => "11100", 402 => "00000", 403 => "11110", 404 to 415=> "00000", 416 => "00010", 
    417 => "00100", 418 => "00110", 419 => "01000", 420 => "01010", 421 => "01100", 
    422 => "01110", 423 => "10000", 424 => "10010", 425 => "10100", 426 => "00000", 
    427 => "10110", 428 => "11000", 429 => "00000", 430 => "11010", 431 to 432=> "00000", 
    433 => "11100", 434 to 441=> "00000", 442 => "11110", 443 to 447=> "00000", 448 => "00010", 
    449 => "00100", 450 => "00110", 451 => "01000", 452 => "00000", 453 => "01010", 
    454 => "01100", 455 => "01110", 456 => "10000", 457 to 458=> "00000", 459 => "10010", 
    460 => "10100", 461 => "10110", 462 => "00000", 463 => "11000", 464 to 465=> "00000", 
    466 => "11010", 467 => "11100", 468 => "11110", 469 to 479=> "00000", 480 => "00010", 
    481 => "00100", 482 => "00110", 483 => "00000", 484 => "01000", 485 => "01010", 
    486 => "01100", 487 => "01110", 488 => "00000", 489 => "10000", 490 => "10010", 
    491 => "10100", 492 => "10110", 493 to 494=> "00000", 495 => "11000", 496 => "11010", 
    497 => "11100", 498 => "00000", 499 => "11110", 500 to 511=> "00000" );


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

entity predict_ensemble_Ngs is
    generic (
        DataWidth : INTEGER := 5;
        AddressRange : INTEGER := 512;
        AddressWidth : INTEGER := 9);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_Ngs is
    component predict_ensemble_Ngs_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Ngs_rom_U :  component predict_ensemble_Ngs_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


