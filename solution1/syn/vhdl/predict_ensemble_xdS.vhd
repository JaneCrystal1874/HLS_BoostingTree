-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_xdS_rom is 
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


architecture rtl of predict_ensemble_xdS_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 to 4=> "1", 5 => "0", 6 => "1", 7 to 10=> "0", 11 => "1", 12 to 15=> "0", 
    16 => "1", 17 to 18=> "0", 19 to 27=> "1", 28 => "0", 29 to 30=> "1", 31 to 39=> "0", 40 => "1", 
    41 to 43=> "0", 44 => "1", 45 to 46=> "0", 47 => "1", 48 => "0", 49 to 55=> "1", 56 => "0", 
    57 to 62=> "1", 63 to 67=> "0", 68 => "1", 69 to 72=> "0", 73 => "1", 74 => "0", 75 to 76=> "1", 
    77 => "0", 78 to 79=> "1", 80 => "0", 81 to 82=> "1", 83 to 84=> "0", 85 => "1", 86 to 87=> "0", 
    88 to 94=> "1", 95 to 100=> "0", 101 to 102=> "1", 103 to 105=> "0", 106 => "1", 107 to 108=> "0", 109 to 110=> "1", 
    111 => "0", 112 => "1", 113 to 115=> "0", 116 to 118=> "1", 119 => "0", 120 to 126=> "1", 127 to 136=> "0", 
    137 => "1", 138 to 139=> "0", 140 => "1", 141 => "0", 142 to 146=> "1", 147 to 148=> "0", 149 to 151=> "1", 
    152 => "0", 153 to 158=> "1", 159 to 164=> "0", 165 => "1", 166 to 170=> "0", 171 => "1", 172 => "0", 
    173 => "1", 174 to 176=> "0", 177 to 178=> "1", 179 => "0", 180 to 190=> "1", 191 to 199=> "0", 200 to 201=> "1", 
    202 to 203=> "0", 204 to 205=> "1", 206 => "0", 207 => "1", 208 => "0", 209 to 210=> "1", 211 => "0", 
    212 => "1", 213 to 214=> "0", 215 to 222=> "1", 223 to 228=> "0", 229 => "1", 230 to 233=> "0", 234 => "1", 
    235 to 236=> "0", 237 to 239=> "1", 240 to 241=> "0", 242 => "1", 243 to 244=> "0", 245 to 254=> "1", 255 to 257=> "0", 
    258 => "1", 259 to 263=> "0", 264 => "1", 265 => "0", 266 to 267=> "1", 268 to 269=> "0", 270 to 272=> "1", 
    273 to 276=> "0", 277 to 279=> "1", 280 => "0", 281 to 286=> "1", 287 to 295=> "0", 296 to 298=> "1", 299 to 302=> "0", 
    303 to 304=> "1", 305 to 306=> "0", 307 to 310=> "1", 311 => "0", 312 to 318=> "1", 319 to 321=> "0", 322 => "1", 
    323 to 326=> "0", 327 => "1", 328 to 330=> "0", 331 => "1", 332 to 335=> "0", 336 to 337=> "1", 338 => "0", 
    339 to 344=> "1", 345 => "0", 346 to 350=> "1", 351 to 355=> "0", 356 => "1", 357 to 359=> "0", 360 => "1", 
    361 to 362=> "0", 363 => "1", 364 to 365=> "0", 366 => "1", 367 => "0", 368 => "1", 369 => "0", 
    370 => "1", 371 to 372=> "0", 373 to 382=> "1", 383 to 388=> "0", 389 => "1", 390 to 392=> "0", 393 => "1", 
    394 => "0", 395 => "1", 396 => "0", 397 => "1", 398 to 401=> "0", 402 => "1", 403 => "0", 
    404 to 414=> "1", 415 to 425=> "0", 426 => "1", 427 to 428=> "0", 429 => "1", 430 => "0", 431 to 432=> "1", 
    433 => "0", 434 to 441=> "1", 442 => "0", 443 to 446=> "1", 447 to 451=> "0", 452 => "1", 453 to 456=> "0", 
    457 to 458=> "1", 459 to 461=> "0", 462 => "1", 463 => "0", 464 to 465=> "1", 466 to 468=> "0", 469 to 478=> "1", 
    479 to 482=> "0", 483 => "1", 484 to 487=> "0", 488 => "1", 489 to 492=> "0", 493 to 494=> "1", 495 to 497=> "0", 
    498 => "1", 499 => "0", 500 to 510=> "1", 511 => "0" );

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

entity predict_ensemble_xdS is
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

architecture arch of predict_ensemble_xdS is
    component predict_ensemble_xdS_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_xdS_rom_U :  component predict_ensemble_xdS_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


