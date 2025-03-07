-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eoQ_rom is 
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


architecture rtl of predict_ensemble_eoQ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "1101", 4 => "0101", 
    5 to 6=> "0000", 7 => "0101", 8 => "0000", 9 => "1011", 10 => "0000", 
    11 => "0011", 12 => "1000", 13 => "0111", 14 => "0101", 15 => "0111", 
    16 => "0011", 17 => "0101", 18 to 20=> "0000", 21 => "1101", 22 => "1001", 
    23 to 28=> "0000", 29 to 30=> "0011", 31 => "0000", 32 => "0101", 33 => "0000", 
    34 => "1011", 35 to 36=> "0000", 37 => "0010", 38 => "0001", 39 => "0000", 
    40 => "1101", 41 => "0000", 42 => "1001", 43 => "1011", 44 => "1100", 
    45 => "1001", 46 to 47=> "0000", 48 => "1011", 49 to 50=> "0000", 51 => "1011", 
    52 => "0100", 53 => "0010", 54 => "0101", 55 => "0011", 56 => "1010", 
    57 to 63=> "0000", 64 => "1101", 65 => "0000", 66 => "0111", 67 to 68=> "0000", 
    69 => "1011", 70 => "0011", 71 => "0000", 72 => "1000", 73 => "0000", 
    74 => "1001", 75 => "0000", 76 => "0111", 77 => "0000", 78 => "0011", 
    79 to 80=> "1000", 81 => "0000", 82 => "0011", 83 to 84=> "0000", 85 => "0001", 
    86 => "0000", 87 => "1000", 88 => "1010", 89 => "0000", 90 => "0111", 
    91 => "0000", 92 => "0101", 93 => "0100", 94 to 98=> "0000", 99 => "1000", 
    100 => "1101", 101 => "0001", 102 to 105=> "0000", 106 => "1010", 107 => "0000", 
    108 => "1010", 109 => "0000", 110 => "0111", 111 => "0000", 112 => "1100", 
    113 => "0000", 114 => "0001", 115 => "1100", 116 => "0110", 117 => "0100", 
    118 to 119=> "0000", 120 => "1100", 121 => "0000", 122 => "1001", 123 to 125=> "0000", 
    126 => "1001", 127 => "0111", 128 => "0100", 129 to 130=> "0000", 131 => "0100", 
    132 => "1101", 133 => "0100", 134 => "0000", 135 => "1010", 136 => "0101", 
    137 to 138=> "0000", 139 => "0100", 140 => "0000", 141 => "0100", 142 to 144=> "0000", 
    145 to 146=> "0110", 147 to 148=> "0000", 149 to 150=> "0110", 151 => "1000", 152 to 153=> "0000", 
    154 => "1011", 155 to 156=> "0000", 157 => "0001", 158 => "0000", 159 => "1011", 
    160 => "1101", 161 => "0000", 162 => "0100", 163 to 164=> "0000", 165 => "0110", 
    166 => "0010", 167 to 194=> "0000" );

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

entity predict_ensemble_eoQ is
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

architecture arch of predict_ensemble_eoQ is
    component predict_ensemble_eoQ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eoQ_rom_U :  component predict_ensemble_eoQ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


