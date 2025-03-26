-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_wdI_rom is 
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


architecture rtl of predict_ensemble_wdI_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 4=> "0", 5 => "1", 6 to 8=> "0", 9 to 10=> "1", 11 to 14=> "0", 15 to 16=> "1", 17 to 18=> "0", 
    19 => "1", 20 => "0", 21 to 30=> "1", 31 to 32=> "0", 33 => "1", 34 to 37=> "0", 38 to 39=> "1", 
    40 to 43=> "0", 44 => "1", 45 to 46=> "0", 47 to 48=> "1", 49 to 52=> "0", 53 to 62=> "1", 63 to 67=> "0", 
    68 to 69=> "1", 70 to 72=> "0", 73 => "1", 74 to 80=> "0", 81 to 84=> "1", 85 => "0", 86 to 94=> "1", 
    95 to 98=> "0", 99 to 101=> "1", 102 to 112=> "0", 113 to 115=> "1", 116 => "0", 117 to 126=> "1", 127 to 135=> "0", 
    136 to 140=> "1", 141 to 143=> "0", 144 => "1", 145 to 148=> "0", 149 to 158=> "1", 159 to 162=> "0", 163 to 164=> "1", 
    165 to 171=> "0", 172 to 174=> "1", 175 => "0", 176 => "1", 177 to 178=> "0", 179 to 180=> "1", 181 => "0", 
    182 to 185=> "1", 186 => "0", 187 to 190=> "1", 191 to 193=> "0", 194 => "1", 195 to 198=> "0", 199 => "1", 
    200 to 201=> "0", 202 => "1", 203 to 204=> "0", 205 => "1", 206 => "0", 207 to 210=> "1", 211 to 214=> "0", 
    215 to 222=> "1", 223 to 226=> "0", 227 => "1", 228 to 230=> "0", 231 => "1", 232 to 235=> "0", 236 to 238=> "1", 
    239 => "0", 240 => "1", 241 to 242=> "0", 243 to 244=> "1", 245 => "0", 246 to 247=> "1", 248 => "0", 
    249 to 254=> "1", 255 to 260=> "0", 261 => "1", 262 to 264=> "0", 265 => "1", 266 => "0", 267 => "1", 
    268 to 269=> "0", 270 to 271=> "1", 272 => "0", 273 to 274=> "1", 275 to 276=> "0", 277 => "1", 278 => "0", 
    279 to 286=> "1", 287 to 294=> "0", 295 => "1", 296 to 297=> "0", 298 => "1", 299 to 300=> "0", 301 => "1", 
    302 => "0", 303 to 309=> "1", 310 to 312=> "0", 313 to 318=> "1", 319 to 327=> "0", 328 => "1", 329 to 330=> "0", 
    331 to 333=> "1", 334 to 337=> "0", 338 to 341=> "1", 342 => "0", 343 to 350=> "1", 351 to 353=> "0", 354 => "1", 
    355 to 358=> "0", 359 to 360=> "1", 361 to 365=> "0", 366 to 367=> "1", 368 to 371=> "0", 372 to 382=> "1", 383 to 384=> "0", 
    385 => "1", 386 to 390=> "0", 391 => "1", 392 to 393=> "0", 394 to 396=> "1", 397 to 399=> "0", 400 => "1", 
    401 to 404=> "0", 405 to 414=> "1", 415 to 419=> "0", 420 => "1", 421 to 424=> "0", 425 to 427=> "1", 428 to 430=> "0", 
    431 to 433=> "1", 434 to 435=> "0", 436 to 439=> "1", 440 => "0", 441 to 443=> "1", 444 => "0", 445 to 446=> "1", 
    447 to 455=> "0", 456 => "1", 457 => "0", 458 => "1", 459 => "0", 460 to 461=> "1", 462 => "0", 
    463 => "1", 464 => "0", 465 to 466=> "1", 467 => "0", 468 => "1", 469 to 470=> "0", 471 to 478=> "1", 
    479 to 484=> "0", 485 => "1", 486 to 492=> "0", 493 to 499=> "1", 500 to 502=> "0", 503 to 510=> "1", 511 => "0" );

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

entity predict_ensemble_wdI is
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

architecture arch of predict_ensemble_wdI is
    component predict_ensemble_wdI_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_wdI_rom_U :  component predict_ensemble_wdI_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


