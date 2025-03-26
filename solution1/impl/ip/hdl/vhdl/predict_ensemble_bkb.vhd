-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bkb_rom is 
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


architecture rtl of predict_ensemble_bkb_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 8=> "0", 9 to 10=> "1", 11 to 12=> "0", 13 => "1", 14 to 15=> "0", 16 => "1", 17 to 18=> "0", 
    19 to 30=> "1", 31 to 32=> "0", 33 => "1", 34 to 36=> "0", 37 to 38=> "1", 39 to 40=> "0", 41 to 42=> "1", 
    43 => "0", 44 => "1", 45 => "0", 46 to 47=> "1", 48 to 49=> "0", 50 => "1", 51 to 53=> "0", 
    54 => "1", 55 to 56=> "0", 57 to 62=> "1", 63 to 66=> "0", 67 to 68=> "1", 69 to 70=> "0", 71 to 73=> "1", 
    74 to 76=> "0", 77 to 79=> "1", 80 => "0", 81 => "1", 82 to 85=> "0", 86 => "1", 87 to 88=> "0", 
    89 to 94=> "1", 95 to 98=> "0", 99 to 101=> "1", 102 => "0", 103 => "1", 104 to 108=> "0", 109 => "1", 
    110 to 111=> "0", 112 to 115=> "1", 116 to 118=> "0", 119 => "1", 120 => "0", 121 to 126=> "1", 127 to 140=> "0", 
    141 => "1", 142 => "0", 143 to 148=> "1", 149 => "0", 150 to 158=> "1", 159 to 164=> "0", 165 to 166=> "1", 
    167 to 169=> "0", 170 => "1", 171 to 172=> "0", 173 to 174=> "1", 175 => "0", 176 => "1", 177 to 178=> "0", 
    179 => "1", 180 => "0", 181 to 182=> "1", 183 => "0", 184 to 190=> "1", 191 to 202=> "0", 203 to 205=> "1", 
    206 to 208=> "0", 209 to 213=> "1", 214 => "0", 215 to 222=> "1", 223 to 225=> "0", 226 => "1", 227 to 234=> "0", 
    235 => "1", 236 to 240=> "0", 241 to 254=> "1", 255 to 260=> "0", 261 => "1", 262 to 263=> "0", 264 => "1", 
    265 => "0", 266 => "1", 267 to 268=> "0", 269 => "1", 270 => "0", 271 => "1", 272 => "0", 
    273 => "1", 274 to 276=> "0", 277 to 286=> "1", 287 to 291=> "0", 292 => "1", 293 to 296=> "0", 297 to 298=> "1", 
    299 to 305=> "0", 306 to 318=> "1", 319 to 327=> "0", 328 to 330=> "1", 331 to 334=> "0", 335 => "1", 336 to 337=> "0", 
    338 to 343=> "1", 344 => "0", 345 to 350=> "1", 351 to 358=> "0", 359 to 360=> "1", 361 to 366=> "0", 367 to 372=> "1", 
    373 => "0", 374 to 375=> "1", 376 => "0", 377 to 382=> "1", 383 to 388=> "0", 389 => "1", 390 to 392=> "0", 
    393 to 395=> "1", 396 to 398=> "0", 399 => "1", 400 to 403=> "0", 404 to 414=> "1", 415 to 424=> "0", 425 to 426=> "1", 
    427 to 429=> "0", 430 => "1", 431 to 432=> "0", 433 to 438=> "1", 439 => "0", 440 to 446=> "1", 447 to 452=> "0", 
    453 => "1", 454 to 456=> "0", 457 to 459=> "1", 460 to 466=> "0", 467 to 478=> "1", 479 to 483=> "0", 484 => "1", 
    485 to 487=> "0", 488 to 489=> "1", 490 to 494=> "0", 495 to 497=> "1", 498 to 500=> "0", 501 to 510=> "1", 511 => "0" );

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

entity predict_ensemble_bkb is
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

architecture arch of predict_ensemble_bkb is
    component predict_ensemble_bkb_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bkb_rom_U :  component predict_ensemble_bkb_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


