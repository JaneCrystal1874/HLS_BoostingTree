-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dEe_rom is 
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


architecture rtl of predict_ensemble_dEe_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 5=> "0", 6 => "1", 7 => "0", 8 to 9=> "1", 10 to 11=> "0", 12 to 13=> "1", 14 to 18=> "0", 
    19 to 23=> "1", 24 => "0", 25 to 30=> "1", 31 to 39=> "0", 40 to 42=> "1", 43 to 46=> "0", 47 to 48=> "1", 
    49 to 50=> "0", 51 to 52=> "1", 53 => "0", 54 to 62=> "1", 63 to 67=> "0", 68 => "1", 69 to 70=> "0", 
    71 => "1", 72 to 74=> "0", 75 => "1", 76 to 77=> "0", 78 => "1", 79 => "0", 80 => "1", 
    81 to 83=> "0", 84 to 94=> "1", 95 to 103=> "0", 104 => "1", 105 to 106=> "0", 107 to 108=> "1", 109 to 110=> "0", 
    111 to 112=> "1", 113 to 114=> "0", 115 to 119=> "1", 120 => "0", 121 to 126=> "1", 127 to 138=> "0", 139 to 141=> "1", 
    142 to 144=> "0", 145 to 151=> "1", 152 => "0", 153 to 158=> "1", 159 to 167=> "0", 168 => "1", 169 => "0", 
    170 => "1", 171 => "0", 172 to 173=> "1", 174 to 175=> "0", 176 to 181=> "1", 182 => "0", 183 => "1", 
    184 to 185=> "0", 186 to 190=> "1", 191 to 199=> "0", 200 => "1", 201 to 206=> "0", 207 to 213=> "1", 214 => "0", 
    215 to 222=> "1", 223 to 224=> "0", 225 => "1", 226 to 230=> "0", 231 => "1", 232 to 233=> "0", 234 to 236=> "1", 
    237 to 242=> "0", 243 => "1", 244 => "0", 245 to 254=> "1", 255 to 266=> "0", 267 to 268=> "1", 269 to 271=> "0", 
    272 to 277=> "1", 278 => "0", 279 to 286=> "1", 287 to 291=> "0", 292 => "1", 293 to 295=> "0", 296 to 299=> "1", 
    300 to 302=> "0", 303 => "1", 304 => "0", 305 to 308=> "1", 309 to 311=> "0", 312 to 313=> "1", 314 => "0", 
    315 to 318=> "1", 319 to 323=> "0", 324 to 325=> "1", 326 to 332=> "0", 333 => "1", 334 to 336=> "0", 337 => "1", 
    338 => "0", 339 to 350=> "1", 351 to 355=> "0", 356 to 357=> "1", 358 to 359=> "0", 360 => "1", 361 to 363=> "0", 
    364 to 365=> "1", 366 => "0", 367 => "1", 368 to 372=> "0", 373 to 382=> "1", 383 to 384=> "0", 385 => "1", 
    386 to 389=> "0", 390 to 391=> "1", 392 to 398=> "0", 399 => "1", 400 => "0", 401 => "1", 402 to 403=> "0", 
    404 to 414=> "1", 415 to 420=> "0", 421 => "1", 422 to 423=> "0", 424 to 426=> "1", 427 to 430=> "0", 431 => "1", 
    432 to 434=> "0", 435 to 439=> "1", 440 => "0", 441 to 446=> "1", 447 to 455=> "0", 456 to 458=> "1", 459 to 460=> "0", 
    461 => "1", 462 => "0", 463 to 464=> "1", 465 to 466=> "0", 467 => "1", 468 to 469=> "0", 470 to 478=> "1", 
    479 to 482=> "0", 483 to 485=> "1", 486 => "0", 487 => "1", 488 to 490=> "0", 491 to 493=> "1", 494 => "0", 
    495 => "1", 496 to 499=> "0", 500 => "1", 501 to 502=> "0", 503 to 506=> "1", 507 => "0", 508 to 510=> "1", 
    511 => "0" );

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

entity predict_ensemble_dEe is
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

architecture arch of predict_ensemble_dEe is
    component predict_ensemble_dEe_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dEe_rom_U :  component predict_ensemble_dEe_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


