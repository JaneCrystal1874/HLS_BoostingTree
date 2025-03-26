-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_vdy_rom is 
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


architecture rtl of predict_ensemble_vdy_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 9=> "0", 10 => "1", 11 to 14=> "0", 15 to 16=> "1", 17 => "0", 18 to 30=> "1", 31 to 33=> "0", 
    34 => "1", 35 to 38=> "0", 39 => "1", 40 to 44=> "0", 45 to 46=> "1", 47 => "0", 48 to 49=> "1", 
    50 => "0", 51 to 52=> "1", 53 to 54=> "0", 55 to 62=> "1", 63 to 67=> "0", 68 => "1", 69 to 77=> "0", 
    78 to 79=> "1", 80 to 81=> "0", 82 to 94=> "1", 95 to 99=> "0", 100 => "1", 101 to 103=> "0", 104 => "1", 
    105 => "0", 106 => "1", 107 to 108=> "0", 109 to 110=> "1", 111 to 113=> "0", 114 => "1", 115 to 116=> "0", 
    117 to 126=> "1", 127 to 136=> "0", 137 to 138=> "1", 139 => "0", 140 to 141=> "1", 142 to 145=> "0", 146 to 149=> "1", 
    150 => "0", 151 to 158=> "1", 159 to 168=> "0", 169 => "1", 170 => "0", 171 => "1", 172 to 174=> "0", 
    175 => "1", 176 => "0", 177 to 184=> "1", 185 => "0", 186 to 190=> "1", 191 to 202=> "0", 203 => "1", 
    204 => "0", 205 => "1", 206 => "0", 207 => "1", 208 => "0", 209 to 216=> "1", 217 => "0", 
    218 to 222=> "1", 223 to 227=> "0", 228 => "1", 229 to 232=> "0", 233 to 234=> "1", 235 to 237=> "0", 238 to 244=> "1", 
    245 => "0", 246 => "1", 247 => "0", 248 => "1", 249 to 250=> "0", 251 to 254=> "1", 255 to 264=> "0", 
    265 => "1", 266 to 271=> "0", 272 to 286=> "1", 287 to 293=> "0", 294 => "1", 295 to 296=> "0", 297 => "1", 
    298 to 302=> "0", 303 to 304=> "1", 305 to 306=> "0", 307 to 318=> "1", 319 to 322=> "0", 323 => "1", 324 to 328=> "0", 
    329 => "1", 330 to 333=> "0", 334 to 335=> "1", 336 to 337=> "0", 338 to 341=> "1", 342 => "0", 343 to 350=> "1", 
    351 to 360=> "0", 361 to 362=> "1", 363 to 365=> "0", 366 to 370=> "1", 371 => "0", 372 => "1", 373 to 374=> "0", 
    375 to 382=> "1", 383 to 386=> "0", 387 to 388=> "1", 389 to 390=> "0", 391 => "1", 392 => "0", 393 => "1", 
    394 => "0", 395 to 396=> "1", 397 to 398=> "0", 399 => "1", 400 to 402=> "0", 403 to 404=> "1", 405 to 406=> "0", 
    407 => "1", 408 => "0", 409 to 414=> "1", 415 to 424=> "0", 425 => "1", 426 => "0", 427 to 429=> "1", 
    430 to 432=> "0", 433 to 434=> "1", 435 => "0", 436 to 437=> "1", 438 => "0", 439 to 446=> "1", 447 to 449=> "0", 
    450 => "1", 451 to 453=> "0", 454 to 455=> "1", 456 to 457=> "0", 458 => "1", 459 to 464=> "0", 465 => "1", 
    466 => "0", 467 to 468=> "1", 469 => "0", 470 to 478=> "1", 479 to 482=> "0", 483 to 484=> "1", 485 to 492=> "0", 
    493 to 494=> "1", 495 to 498=> "0", 499 to 510=> "1", 511 => "0" );

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

entity predict_ensemble_vdy is
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

architecture arch of predict_ensemble_vdy is
    component predict_ensemble_vdy_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_vdy_rom_U :  component predict_ensemble_vdy_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


