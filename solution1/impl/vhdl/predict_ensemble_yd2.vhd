-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_yd2_rom is 
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


architecture rtl of predict_ensemble_yd2_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 4=> "0", 5 => "1", 6 to 7=> "0", 8 => "1", 9 to 11=> "0", 12 to 13=> "1", 14 => "0", 
    15 to 16=> "1", 17 => "0", 18 => "1", 19 => "0", 20 => "1", 21 to 22=> "0", 23 to 30=> "1", 
    31 to 33=> "0", 34 => "1", 35 to 37=> "0", 38 to 39=> "1", 40 to 41=> "0", 42 to 43=> "1", 44 to 45=> "0", 
    46 => "1", 47 to 48=> "0", 49 to 50=> "1", 51 to 54=> "0", 55 to 62=> "1", 63 to 72=> "0", 73 => "1", 
    74 to 76=> "0", 77 => "1", 78 => "0", 79 to 84=> "1", 85 => "0", 86 to 87=> "1", 88 => "0", 
    89 to 94=> "1", 95 to 99=> "0", 100 => "1", 101 to 105=> "0", 106 to 107=> "1", 108 to 110=> "0", 111 => "1", 
    112 => "0", 113 to 115=> "1", 116 => "0", 117 to 119=> "1", 120 => "0", 121 to 126=> "1", 127 to 137=> "0", 
    138 to 141=> "1", 142 to 145=> "0", 146 to 149=> "1", 150 => "0", 151 to 158=> "1", 159 to 161=> "0", 162 => "1", 
    163 to 169=> "0", 170 to 172=> "1", 173 to 174=> "0", 175 => "1", 176 => "0", 177 to 178=> "1", 179 to 180=> "0", 
    181 to 183=> "1", 184 => "0", 185 to 190=> "1", 191 to 195=> "0", 196 to 197=> "1", 198 to 202=> "0", 203 to 204=> "1", 
    205 to 208=> "0", 209 to 214=> "1", 215 to 216=> "0", 217 to 222=> "1", 223 to 228=> "0", 229 => "1", 230 to 237=> "0", 
    238 to 239=> "1", 240 => "0", 241 to 247=> "1", 248 => "0", 249 to 254=> "1", 255 to 259=> "0", 260 to 261=> "1", 
    262 to 263=> "0", 264 => "1", 265 => "0", 266 => "1", 267 to 269=> "0", 270 => "1", 271 to 272=> "0", 
    273 => "1", 274 => "0", 275 to 276=> "1", 277 to 278=> "0", 279 to 286=> "1", 287 to 292=> "0", 293 => "1", 
    294 to 295=> "0", 296 to 298=> "1", 299 to 301=> "0", 302 => "1", 303 to 306=> "0", 307 to 314=> "1", 315 => "0", 
    316 to 318=> "1", 319 to 323=> "0", 324 => "1", 325 to 326=> "0", 327 => "1", 328 => "0", 329 to 330=> "1", 
    331 to 335=> "0", 336 => "1", 337 to 338=> "0", 339 to 347=> "1", 348 => "0", 349 to 350=> "1", 351 to 355=> "0", 
    356 to 357=> "1", 358 to 364=> "0", 365 => "1", 366 => "0", 367 => "1", 368 => "0", 369 => "1", 
    370 to 371=> "0", 372 to 382=> "1", 383 to 391=> "0", 392 => "1", 393 => "0", 394 => "1", 395 to 396=> "0", 
    397 => "1", 398 => "0", 399 to 401=> "1", 402 => "0", 403 to 405=> "1", 406 => "0", 407 => "1", 
    408 => "0", 409 to 414=> "1", 415 to 418=> "0", 419 => "1", 420 => "0", 421 => "1", 422 to 423=> "0", 
    424 => "1", 425 to 426=> "0", 427 => "1", 428 to 432=> "0", 433 to 437=> "1", 438 => "0", 439 to 440=> "1", 
    441 => "0", 442 to 446=> "1", 447 to 451=> "0", 452 to 453=> "1", 454 to 463=> "0", 464 to 465=> "1", 466 => "0", 
    467 to 478=> "1", 479 to 482=> "0", 483 to 484=> "1", 485 to 487=> "0", 488 to 489=> "1", 490 => "0", 491 to 493=> "1", 
    494 to 496=> "0", 497 to 499=> "1", 500 => "0", 501 => "1", 502 to 504=> "0", 505 to 507=> "1", 508 => "0", 
    509 to 510=> "1", 511 => "0" );

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

entity predict_ensemble_yd2 is
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

architecture arch of predict_ensemble_yd2 is
    component predict_ensemble_yd2_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_yd2_rom_U :  component predict_ensemble_yd2_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


