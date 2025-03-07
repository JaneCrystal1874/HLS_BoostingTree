-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dbE_rom is 
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


architecture rtl of predict_ensemble_dbE_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "0000", 4 => "1000", 
    5 => "1011", 6 => "0000", 7 => "0011", 8 => "0101", 9 to 10=> "0000", 
    11 => "0101", 12 => "0000", 13 => "0011", 14 to 15=> "0000", 16 => "0011", 
    17 => "0000", 18 => "0111", 19 => "0010", 20 => "0111", 21 to 23=> "0000", 
    24 => "1011", 25 => "0000", 26 => "0111", 27 => "0000", 28 to 29=> "0010", 
    30 => "0000", 31 => "0111", 32 to 33=> "0000", 34 => "0111", 35 => "1001", 
    36 => "0010", 37 => "1001", 38 to 39=> "0000", 40 => "0101", 41 => "1101", 
    42 to 43=> "0000", 44 => "1100", 45 => "1011", 46 => "1001", 47 to 50=> "0000", 
    51 => "0011", 52 => "0111", 53 => "1010", 54 => "0000", 55 => "0100", 
    56 => "1010", 57 to 60=> "0000", 61 => "0110", 62 => "0000", 63 => "1010", 
    64 => "0101", 65 => "0100", 66 to 68=> "0000", 69 => "1000", 70 => "0000", 
    71 => "0111", 72 => "1100", 73 => "0010", 74 => "0000", 75 => "1101", 
    76 => "0000", 77 => "0011", 78 to 81=> "0000", 82 => "0100", 83 => "0001", 
    84 => "0100", 85 => "0000", 86 => "1010", 87 => "1000", 88 to 89=> "0000", 
    90 => "0100", 91 to 92=> "0000", 93 to 94=> "1000", 95 => "0001", 96 => "0000", 
    97 => "0101", 98 => "0000", 99 to 100=> "0001", 101 => "1010", 102 => "0000", 
    103 => "1100", 104 to 105=> "0000", 106 => "1010", 107 to 108=> "0000", 109 => "1000", 
    110 => "1100", 111 to 112=> "0000", 113 => "1010", 114 to 115=> "0000", 116 => "1001", 
    117 => "1010", 118 => "0001", 119 => "0000", 120 => "1001", 121 => "1101", 
    122 to 123=> "0000", 124 to 125=> "0011", 126 to 127=> "0000", 128 to 129=> "1001", 130 => "0011", 
    131 to 134=> "0000", 135 => "1100", 136 to 137=> "0000", 138 => "0111", 139 => "0100", 
    140 to 141=> "0000", 142 => "1011", 143 => "1001", 144 to 145=> "0000", 146 => "1101", 
    147 => "0011", 148 => "0010", 149 => "0000", 150 => "1101", 151 => "0000", 
    152 => "1000", 153 to 154=> "0000", 155 => "0100", 156 => "1011", 157 to 161=> "0000", 
    162 => "1101", 163 => "1010", 164 => "0110", 165 => "0101", 166 to 167=> "0000", 
    168 => "0010", 169 to 171=> "0000", 172 => "0100", 173 => "0000", 174 => "0001", 
    175 => "0000", 176 to 177=> "1001", 178 => "0000", 179 => "0011", 180 => "0000", 
    181 => "0011", 182 => "1101", 183 to 185=> "0000", 186 => "1001", 187 to 194=> "0000" );

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

entity predict_ensemble_dbE is
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

architecture arch of predict_ensemble_dbE is
    component predict_ensemble_dbE_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dbE_rom_U :  component predict_ensemble_dbE_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


