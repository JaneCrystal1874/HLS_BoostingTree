-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bDo_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_bDo_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 to 5=> "0", 6 to 7=> "1", 8 => "0", 
    9 => "1", 10 to 13=> "0", 14 to 15=> "1", 16 => "0", 17 => "1", 18 => "0", 19 => "1", 
    20 => "0", 21 to 22=> "1", 23 to 24=> "0", 25 to 26=> "1", 27 => "0", 28 to 29=> "1", 30 => "0", 
    31 => "1", 32 => "0", 33 => "1", 34 => "0", 35 => "1", 36 => "0", 37 => "1", 
    38 => "0", 39 => "1", 40 to 43=> "0", 44 => "1", 45 => "0", 46 to 48=> "1", 49 to 53=> "0", 
    54 => "1", 55 => "0", 56 to 58=> "1", 59 to 63=> "0", 64 => "1", 65 => "0", 66 => "1", 
    67 => "0", 68 => "1", 69 => "0", 70 => "1", 71 => "0", 72 to 75=> "1", 76 to 79=> "0", 
    80 to 81=> "1", 82 to 84=> "0", 85 => "1", 86 => "0", 87 to 89=> "1", 90 to 91=> "0", 92 => "1", 
    93 to 97=> "0", 98 => "1", 99 to 100=> "0", 101 => "1", 102 to 104=> "0", 105 to 109=> "1", 110 => "0", 
    111 to 113=> "1", 114 => "0", 115 to 116=> "1", 117 => "0", 118 => "1", 119 to 120=> "0", 121 to 122=> "1", 
    123 to 125=> "0", 126 to 128=> "1", 129 => "0", 130 => "1", 131 to 136=> "0", 137 => "1", 138 to 140=> "0", 
    141 to 144=> "1", 145 to 147=> "0", 148 => "1", 149 => "0", 150 to 153=> "1", 154 => "0", 155 => "1", 
    156 => "0", 157 to 158=> "1", 159 => "0", 160 => "1", 161 => "0", 162 to 170=> "1", 171 => "0", 
    172 to 173=> "1", 174 => "0", 175 => "1", 176 => "0", 177 => "1", 178 => "0", 179 => "1", 
    180 => "0", 181 => "1", 182 => "0", 183 => "1", 184 => "0", 185 to 186=> "1", 187 to 194=> "0" );

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

entity predict_ensemble_bDo is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_bDo is
    component predict_ensemble_bDo_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bDo_rom_U :  component predict_ensemble_bDo_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


