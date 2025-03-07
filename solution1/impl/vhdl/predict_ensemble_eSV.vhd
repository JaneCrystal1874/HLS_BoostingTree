-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eSV_rom is 
    generic(
             DWIDTH     : integer := 4; 
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


architecture rtl of predict_ensemble_eSV_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1001", 3 => "0111", 4 => "0100", 
    5 => "0101", 6 => "0000", 7 => "0110", 8 => "0000", 9 => "0101", 
    10 => "0000", 11 => "0110", 12 => "0000", 13 => "1011", 14 => "0000", 
    15 => "0110", 16 => "0000", 17 => "0001", 18 => "1011", 19 to 23=> "0000", 
    24 => "1001", 25 => "0000", 26 => "0011", 27 => "0000", 28 => "0111", 
    29 => "1011", 30 to 31=> "0000", 32 => "1000", 33 to 35=> "0101", 36 => "1101", 
    37 => "0011", 38 => "0101", 39 => "0110", 40 => "0000", 41 => "0100", 
    42 to 46=> "0000", 47 => "0110", 48 to 50=> "0000", 51 => "1000", 52 to 53=> "1001", 
    54 to 57=> "0000", 58 => "0111", 59 => "0000", 60 => "1001", 61 => "0111", 
    62 => "1001", 63 to 65=> "0000", 66 => "0110", 67 to 68=> "1011", 69 => "0000", 
    70 => "0101", 71 => "0000", 72 => "0011", 73 => "0001", 74 => "0101", 
    75 => "0000", 76 => "1011", 77 => "0010", 78 => "1100", 79 to 81=> "0000", 
    82 => "0001", 83 => "1011", 84 to 86=> "0000", 87 => "0010", 88 => "0000", 
    89 => "1000", 90 => "0101", 91 => "0000", 92 => "0010", 93 => "0000", 
    94 => "0101", 95 => "0111", 96 to 97=> "0000", 98 => "0010", 99 => "0000", 
    100 => "0111", 101 => "1010", 102 to 103=> "0000", 104 => "0111", 105 => "0000", 
    106 => "0111", 107 => "1010", 108 to 109=> "0000", 110 to 111=> "0111", 112 => "1011", 
    113 to 115=> "0000", 116 => "1000", 117 => "0101", 118 => "0111", 119 => "1011", 
    120 => "1001", 121 => "1000", 122 to 123=> "0000", 124 => "0001", 125 to 129=> "0000", 
    130 => "0010", 131 => "0001", 132 to 135=> "0000", 136 => "1100", 137 => "0000", 
    138 => "0110", 139 => "1101", 140 => "0100", 141 => "1000", 142 => "0000", 
    143 => "0001", 144 to 146=> "0000", 147 => "0011", 148 => "1011", 149 => "0000", 
    150 => "0100", 151 to 152=> "0000", 153 => "1010", 154 => "0111", 155 => "0011", 
    156 => "0000", 157 => "0100", 158 => "0011", 159 to 162=> "0000", 163 => "0111", 
    164 => "0001", 165 => "0110", 166 => "0000", 167 => "0101", 168 to 170=> "0000", 
    171 => "0001", 172 => "0011", 173 to 194=> "0000" );

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

entity predict_ensemble_eSV is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_eSV is
    component predict_ensemble_eSV_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eSV_rom_U :  component predict_ensemble_eSV_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


