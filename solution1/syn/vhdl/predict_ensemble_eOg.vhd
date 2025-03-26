-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eOg_rom is 
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


architecture rtl of predict_ensemble_eOg_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 to 5=> "1", 6 to 7=> "0", 8 => "1", 9 to 14=> "0", 15 => "1", 16 => "0", 
    17 => "1", 18 => "0", 19 to 23=> "1", 24 => "0", 25 to 30=> "1", 31 to 35=> "0", 36 to 37=> "1", 
    38 to 44=> "0", 45 to 46=> "1", 47 to 50=> "0", 51 to 62=> "1", 63 to 65=> "0", 66 => "1", 67 to 70=> "0", 
    71 => "1", 72 to 73=> "0", 74 to 75=> "1", 76 => "0", 77 to 78=> "1", 79 to 80=> "0", 81 => "1", 
    82 to 83=> "0", 84 to 86=> "1", 87 to 88=> "0", 89 to 94=> "1", 95 to 99=> "0", 100 => "1", 101 to 103=> "0", 
    104 => "1", 105 => "0", 106 to 107=> "1", 108 to 109=> "0", 110 => "1", 111 to 114=> "0", 115 to 121=> "1", 
    122 => "0", 123 to 126=> "1", 127 to 132=> "0", 133 => "1", 134 to 135=> "0", 136 to 138=> "1", 139 to 142=> "0", 
    143 => "1", 144 to 147=> "0", 148 to 158=> "1", 159 to 162=> "0", 163 to 165=> "1", 166 => "0", 167 => "1", 
    168 to 170=> "0", 171 to 172=> "1", 173 to 180=> "0", 181 to 190=> "1", 191 to 196=> "0", 197 => "1", 198 to 199=> "0", 
    200 to 201=> "1", 202 => "0", 203 to 204=> "1", 205 => "0", 206 => "1", 207 to 209=> "0", 210 to 211=> "1", 
    212 to 214=> "0", 215 to 222=> "1", 223 to 228=> "0", 229 => "1", 230 to 231=> "0", 232 to 234=> "1", 235 to 242=> "0", 
    243 to 254=> "1", 255 to 264=> "0", 265 => "1", 266 to 267=> "0", 268 => "1", 269 to 270=> "0", 271 to 273=> "1", 
    274 => "0", 275 to 276=> "1", 277 => "0", 278 to 286=> "1", 287 to 291=> "0", 292 to 293=> "1", 294 to 295=> "0", 
    296 => "1", 297 to 298=> "0", 299 => "1", 300 to 304=> "0", 305 to 306=> "1", 307 => "0", 308 to 313=> "1", 
    314 => "0", 315 to 318=> "1", 319 to 320=> "0", 321 => "1", 322 to 330=> "0", 331 to 334=> "1", 335 to 336=> "0", 
    337 => "1", 338 => "0", 339 to 340=> "1", 341 => "0", 342 => "1", 343 => "0", 344 to 350=> "1", 
    351 to 353=> "0", 354 => "1", 355 => "0", 356 => "1", 357 to 359=> "0", 360 to 361=> "1", 362 to 363=> "0", 
    364 => "1", 365 to 370=> "0", 371 => "1", 372 => "0", 373 to 382=> "1", 383 to 387=> "0", 388 => "1", 
    389 to 392=> "0", 393 to 395=> "1", 396 to 397=> "0", 398 to 399=> "1", 400 to 402=> "0", 403 to 408=> "1", 409 to 410=> "0", 
    411 to 414=> "1", 415 to 419=> "0", 420 => "1", 421 to 428=> "0", 429 to 430=> "1", 431 => "0", 432 to 438=> "1", 
    439 to 440=> "0", 441 to 446=> "1", 447 to 451=> "0", 452 => "1", 453 to 454=> "0", 455 to 457=> "1", 458 to 460=> "0", 
    461 to 462=> "1", 463 to 466=> "0", 467 to 468=> "1", 469 => "0", 470 => "1", 471 => "0", 472 to 478=> "1", 
    479 to 483=> "0", 484 => "1", 485 to 490=> "0", 491 => "1", 492 => "0", 493 => "1", 494 to 495=> "0", 
    496 to 497=> "1", 498 to 499=> "0", 500 to 510=> "1", 511 => "0" );

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

entity predict_ensemble_eOg is
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

architecture arch of predict_ensemble_eOg is
    component predict_ensemble_eOg_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eOg_rom_U :  component predict_ensemble_eOg_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


