-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cud_rom is 
    generic(
             DWIDTH     : integer := 1; 
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


architecture rtl of predict_ensemble_cud_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 6=> "0", 7 => "1", 8 to 13=> "0", 14 to 17=> "1", 18 => "0", 19 to 22=> "1", 23 => "0", 
    24 to 30=> "1", 31 to 35=> "0", 36 => "1", 37 to 39=> "0", 40 to 41=> "1", 42 to 45=> "0", 46 to 48=> "1", 
    49 => "0", 50 to 51=> "1", 52 to 53=> "0", 54 to 56=> "1", 57 => "0", 58 to 62=> "1", 63 to 67=> "0", 
    68 to 69=> "1", 70 to 71=> "0", 72 => "1", 73 to 76=> "0", 77 to 78=> "1", 79 to 82=> "0", 83 to 84=> "1", 
    85 => "0", 86 to 94=> "1", 95 to 100=> "0", 101 => "1", 102 => "0", 103 to 104=> "1", 105 => "0", 
    106 => "1", 107 to 113=> "0", 114 to 120=> "1", 121 => "0", 122 to 126=> "1", 127 to 129=> "0", 130 => "1", 
    131 to 134=> "0", 135 => "1", 136 to 142=> "0", 143 => "1", 144 => "0", 145 to 150=> "1", 151 => "0", 
    152 to 158=> "1", 159 to 163=> "0", 164 => "1", 165 to 169=> "0", 170 => "1", 171 to 173=> "0", 174 to 175=> "1", 
    176 => "0", 177 to 178=> "1", 179 => "0", 180 to 181=> "1", 182 => "0", 183 to 190=> "1", 191 to 196=> "0", 
    197 => "1", 198 => "0", 199 to 200=> "1", 201 to 204=> "0", 205 to 208=> "1", 209 to 212=> "0", 213 to 214=> "1", 
    215 => "0", 216 to 222=> "1", 223 to 233=> "0", 234 => "1", 235 => "0", 236 to 237=> "1", 238 to 240=> "0", 
    241 to 247=> "1", 248 => "0", 249 to 254=> "1", 255 to 256=> "0", 257 => "1", 258 to 266=> "0", 267 => "1", 
    268 => "0", 269 to 272=> "1", 273 => "0", 274 to 277=> "1", 278 => "0", 279 to 280=> "1", 281 to 282=> "0", 
    283 to 286=> "1", 287 to 288=> "0", 289 => "1", 290 to 292=> "0", 293 to 294=> "1", 295 to 297=> "0", 298 => "1", 
    299 to 302=> "0", 303 to 305=> "1", 306 => "0", 307 => "1", 308 => "0", 309 => "1", 310 to 311=> "0", 
    312 to 318=> "1", 319 to 323=> "0", 324 => "1", 325 to 328=> "0", 329 to 330=> "1", 331 to 333=> "0", 334 to 335=> "1", 
    336 to 337=> "0", 338 => "1", 339 to 340=> "0", 341 to 350=> "1", 351 to 353=> "0", 354 => "1", 355 to 357=> "0", 
    358 to 359=> "1", 360 to 361=> "0", 362 => "1", 363 to 366=> "0", 367 to 368=> "1", 369 to 370=> "0", 371 to 373=> "1", 
    374 => "0", 375 to 376=> "1", 377 => "0", 378 to 382=> "1", 383 to 391=> "0", 392 to 397=> "1", 398 to 399=> "0", 
    400 => "1", 401 to 402=> "0", 403 to 404=> "1", 405 to 407=> "0", 408 to 414=> "1", 415 to 424=> "0", 425 => "1", 
    426 => "0", 427 => "1", 428 to 430=> "0", 431 to 432=> "1", 433 to 434=> "0", 435 to 446=> "1", 447 to 451=> "0", 
    452 => "1", 453 to 456=> "0", 457 => "1", 458 => "0", 459 => "1", 460 to 461=> "0", 462 => "1", 
    463 to 464=> "0", 465 to 466=> "1", 467 to 468=> "0", 469 to 478=> "1", 479 to 487=> "0", 488 to 492=> "1", 493 to 496=> "0", 
    497 to 498=> "1", 499 to 501=> "0", 502 to 510=> "1", 511 => "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

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

entity predict_ensemble_cud is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 512;
        AddressWidth : INTEGER := 9);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_cud is
    component predict_ensemble_cud_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cud_rom_U :  component predict_ensemble_cud_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


