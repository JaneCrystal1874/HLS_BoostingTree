-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dqG_rom is 
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


architecture rtl of predict_ensemble_dqG_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0111", 1 => "1011", 2 => "0101", 3 => "0000", 4 => "1011", 
    5 => "0000", 6 => "1010", 7 => "1001", 8 => "1011", 9 => "1010", 
    10 => "0010", 11 => "0000", 12 => "1010", 13 => "0000", 14 => "0011", 
    15 to 21=> "0000", 22 => "1001", 23 => "0000", 24 to 25=> "0101", 26 => "0000", 
    27 => "1011", 28 => "0000", 29 to 30=> "1011", 31 => "1000", 32 to 33=> "0000", 
    34 => "0101", 35 to 36=> "0000", 37 => "0001", 38 => "0101", 39 to 40=> "0000", 
    41 to 42=> "0101", 43 => "0100", 44 to 45=> "0000", 46 => "0111", 47 => "0000", 
    48 => "0101", 49 => "0100", 50 => "0111", 51 to 55=> "0000", 56 => "0111", 
    57 => "0101", 58 => "1000", 59 => "0000", 60 => "0100", 61 => "0000", 
    62 => "0101", 63 => "0000", 64 => "0100", 65 to 66=> "1010", 67 to 68=> "0000", 
    69 => "0001", 70 => "0000", 71 => "1010", 72 to 75=> "0000", 76 => "0011", 
    77 => "0000", 78 => "1011", 79 => "1010", 80 => "0001", 81 => "1000", 
    82 => "0000", 83 => "0010", 84 to 85=> "0000", 86 => "1101", 87 => "1010", 
    88 to 90=> "0000", 91 => "1011", 92 => "0000", 93 to 94=> "0110", 95 => "1101", 
    96 => "0000", 97 => "1100", 98 => "0011", 99 => "1010", 100 => "0000", 
    101 => "0001", 102 => "0000", 103 => "0101", 104 => "0001", 105 => "0101", 
    106 => "0000", 107 => "1100", 108 => "0000", 109 => "1001", 110 to 115=> "0000", 
    116 => "0100", 117 to 119=> "0000", 120 => "1001", 121 => "0100", 122 to 123=> "0000", 
    124 => "1010", 125 => "0000", 126 to 127=> "1010", 128 => "1101", 129 to 130=> "0000", 
    131 => "0110", 132 => "0000", 133 => "0101", 134 => "1000", 135 => "1100", 
    136 => "0000", 137 => "1100", 138 => "0000", 139 => "1100", 140 => "0011", 
    141 to 142=> "0000", 143 => "1000", 144 => "0001", 145 to 146=> "0000", 147 => "0101", 
    148 => "1000", 149 to 152=> "0000", 153 => "0111", 154 => "1011", 155 => "0000", 
    156 => "0110", 157 => "1100", 158 => "0011", 159 => "0110", 160 => "0000", 
    161 => "0110", 162 to 163=> "0000", 164 => "0101", 165 to 167=> "0000", 168 to 169=> "1000", 
    170 to 171=> "0000", 172 => "1101", 173 to 174=> "0000", 175 => "1000", 176 => "0000", 
    177 => "0001", 178 to 179=> "0000", 180 => "1000", 181 to 194=> "0000" );

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

entity predict_ensemble_dqG is
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

architecture arch of predict_ensemble_dqG is
    component predict_ensemble_dqG_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dqG_rom_U :  component predict_ensemble_dqG_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


