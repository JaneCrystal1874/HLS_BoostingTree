-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_JfO_rom is 
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


architecture rtl of predict_ensemble_JfO_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00001", 1 => "00011", 2 => "00101", 3 to 4=> "00000", 5 => "00111", 
    6 => "00000", 7 => "01001", 8 => "01011", 9 => "01101", 10 => "01111", 
    11 => "00000", 12 => "10001", 13 => "10011", 14 => "10101", 15 => "10111", 
    16 => "00000", 17 => "11001", 18 => "11011", 19 to 27=> "00000", 28 => "11101", 
    29 to 31=> "00000", 32 => "00001", 33 => "00011", 34 => "00101", 35 => "00111", 
    36 => "01001", 37 => "01011", 38 => "01101", 39 => "01111", 40 => "00000", 
    41 => "10001", 42 => "10011", 43 => "10101", 44 => "00000", 45 => "10111", 
    46 => "11001", 47 => "00000", 48 => "11011", 49 to 55=> "00000", 56 => "11101", 
    57 to 63=> "00000", 64 => "00001", 65 => "00011", 66 => "00101", 67 => "00111", 
    68 => "00000", 69 => "01001", 70 => "01011", 71 => "01101", 72 => "01111", 
    73 => "00000", 74 => "10001", 75 to 76=> "00000", 77 => "10011", 78 to 79=> "00000", 
    80 => "10101", 81 to 82=> "00000", 83 => "10111", 84 => "11001", 85 => "00000", 
    86 => "11011", 87 => "11101", 88 to 95=> "00000", 96 => "00001", 97 => "00011", 
    98 => "00101", 99 => "00111", 100 => "01001", 101 to 102=> "00000", 103 => "01011", 
    104 => "01101", 105 => "01111", 106 => "00000", 107 => "10001", 108 => "10011", 
    109 to 110=> "00000", 111 => "10101", 112 => "00000", 113 => "10111", 114 => "11001", 
    115 => "11011", 116 to 118=> "00000", 119 => "11101", 120 to 127=> "00000", 128 => "00001", 
    129 => "00011", 130 => "00101", 131 => "00111", 132 => "01001", 133 => "01011", 
    134 => "01101", 135 => "01111", 136 => "10001", 137 => "00000", 138 => "10011", 
    139 => "10101", 140 => "00000", 141 => "10111", 142 to 146=> "00000", 147 => "11001", 
    148 => "11011", 149 to 151=> "00000", 152 => "11101", 153 to 159=> "00000", 160 => "00001", 
    161 => "00011", 162 => "00101", 163 => "00111", 164 => "01001", 165 => "00000", 
    166 => "01011", 167 => "01101", 168 => "01111", 169 => "10001", 170 => "10011", 
    171 => "00000", 172 => "10101", 173 => "00000", 174 => "10111", 175 => "11001", 
    176 => "11011", 177 to 178=> "00000", 179 => "11101", 180 to 191=> "00000", 192 => "00001", 
    193 => "00011", 194 => "00101", 195 => "00111", 196 => "01001", 197 => "01011", 
    198 => "01101", 199 => "01111", 200 to 201=> "00000", 202 => "10001", 203 => "10011", 
    204 to 205=> "00000", 206 => "10101", 207 => "00000", 208 => "10111", 209 to 210=> "00000", 
    211 => "11001", 212 => "00000", 213 => "11011", 214 => "11101", 215 to 223=> "00000", 
    224 => "00001", 225 => "00011", 226 => "00101", 227 => "00111", 228 => "01001", 
    229 => "00000", 230 => "01011", 231 => "01101", 232 => "01111", 233 => "10001", 
    234 => "00000", 235 => "10011", 236 => "10101", 237 to 239=> "00000", 240 => "10111", 
    241 => "11001", 242 => "00000", 243 => "11011", 244 => "11101", 245 to 255=> "00000", 
    256 => "00001", 257 => "00011", 258 => "00000", 259 => "00101", 260 => "00111", 
    261 => "01001", 262 => "01011", 263 => "01101", 264 => "00000", 265 => "01111", 
    266 to 267=> "00000", 268 => "10001", 269 => "10011", 270 to 272=> "00000", 273 => "10101", 
    274 => "10111", 275 => "11001", 276 => "11011", 277 to 279=> "00000", 280 => "11101", 
    281 to 287=> "00000", 288 => "00001", 289 => "00011", 290 => "00101", 291 => "00111", 
    292 => "01001", 293 => "01011", 294 => "01101", 295 => "01111", 296 to 298=> "00000", 
    299 => "10001", 300 => "10011", 301 => "10101", 302 => "10111", 303 to 304=> "00000", 
    305 => "11001", 306 => "11011", 307 to 310=> "00000", 311 => "11101", 312 to 319=> "00000", 
    320 => "00001", 321 => "00011", 322 => "00000", 323 => "00101", 324 => "00111", 
    325 => "01001", 326 => "01011", 327 => "00000", 328 => "01101", 329 => "01111", 
    330 => "10001", 331 => "00000", 332 => "10011", 333 => "10101", 334 => "10111", 
    335 => "11001", 336 to 337=> "00000", 338 => "11011", 339 to 344=> "00000", 345 => "11101", 
    346 to 351=> "00000", 352 => "00001", 353 => "00011", 354 => "00101", 355 => "00111", 
    356 => "00000", 357 => "01001", 358 => "01011", 359 => "01101", 360 => "00000", 
    361 => "01111", 362 => "10001", 363 => "00000", 364 => "10011", 365 => "10101", 
    366 => "00000", 367 => "10111", 368 => "00000", 369 => "11001", 370 => "00000", 
    371 => "11011", 372 => "11101", 373 to 383=> "00000", 384 => "00001", 385 => "00011", 
    386 => "00101", 387 => "00111", 388 => "01001", 389 => "00000", 390 => "01011", 
    391 => "01101", 392 => "01111", 393 => "00000", 394 => "10001", 395 => "00000", 
    396 => "10011", 397 => "00000", 398 => "10101", 399 => "10111", 400 => "11001", 
    401 => "11011", 402 => "00000", 403 => "11101", 404 to 415=> "00000", 416 => "00001", 
    417 => "00011", 418 => "00101", 419 => "00111", 420 => "01001", 421 => "01011", 
    422 => "01101", 423 => "01111", 424 => "10001", 425 => "10011", 426 => "00000", 
    427 => "10101", 428 => "10111", 429 => "00000", 430 => "11001", 431 to 432=> "00000", 
    433 => "11011", 434 to 441=> "00000", 442 => "11101", 443 to 447=> "00000", 448 => "00001", 
    449 => "00011", 450 => "00101", 451 => "00111", 452 => "00000", 453 => "01001", 
    454 => "01011", 455 => "01101", 456 => "01111", 457 to 458=> "00000", 459 => "10001", 
    460 => "10011", 461 => "10101", 462 => "00000", 463 => "10111", 464 to 465=> "00000", 
    466 => "11001", 467 => "11011", 468 => "11101", 469 to 479=> "00000", 480 => "00001", 
    481 => "00011", 482 => "00101", 483 => "00000", 484 => "00111", 485 => "01001", 
    486 => "01011", 487 => "01101", 488 => "00000", 489 => "01111", 490 => "10001", 
    491 => "10011", 492 => "10101", 493 to 494=> "00000", 495 => "10111", 496 => "11001", 
    497 => "11011", 498 => "00000", 499 => "11101", 500 to 511=> "00000" );


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

entity predict_ensemble_JfO is
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

architecture arch of predict_ensemble_JfO is
    component predict_ensemble_JfO_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_JfO_rom_U :  component predict_ensemble_JfO_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


