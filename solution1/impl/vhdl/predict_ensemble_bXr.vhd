-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bXr_rom is 
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


architecture rtl of predict_ensemble_bXr_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 19=> "0", 20 to 21=> "1", 22 => "0", 23 => "1", 24 => "0", 25 to 27=> "1", 28 to 34=> "0", 
    35 to 39=> "1", 40 to 41=> "0", 42 => "1", 43 => "0", 44 => "1", 45 to 51=> "0", 52 to 53=> "1", 
    54 to 55=> "0", 56 => "1", 57 => "0", 58 => "1", 59 to 60=> "0", 61 to 63=> "1", 64 to 66=> "0", 
    67 => "1", 68 => "0", 69 => "1", 70 => "0", 71 to 72=> "1", 73 to 74=> "0", 75 => "1", 
    76 => "0", 77 => "1", 78 to 80=> "0", 81 to 82=> "1", 83 to 84=> "0", 85 to 88=> "1", 89 => "0", 
    90 to 92=> "1", 93 => "0", 94 to 96=> "1", 97 => "0", 98 => "1", 99 to 100=> "0", 101 to 102=> "1", 
    103 => "0", 104 => "1", 105 => "0", 106 => "1", 107 to 108=> "0", 109 => "1", 110 => "0", 
    111 to 112=> "1", 113 to 114=> "0", 115 to 116=> "1", 117 to 118=> "0", 119 to 120=> "1", 121 to 122=> "0", 123 to 124=> "1", 
    125 => "0", 126 => "1", 127 => "0", 128 => "1", 129 to 131=> "0", 132 => "1", 133 => "0", 
    134 to 136=> "1", 137 to 138=> "0", 139 to 140=> "1", 141 to 142=> "0", 143 to 150=> "1", 151 => "0", 152 to 153=> "1", 
    154 to 155=> "0", 156 => "1", 157 => "0", 158 => "1", 159 => "0", 160 => "1", 161 => "0", 
    162 => "1", 163 to 164=> "0", 165 to 166=> "1", 167 => "0", 168 to 177=> "1", 178 to 179=> "0", 180 to 181=> "1", 
    182 => "0", 183 to 190=> "1", 191 to 194=> "0" );

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

entity predict_ensemble_bXr is
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

architecture arch of predict_ensemble_bXr is
    component predict_ensemble_bXr_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bXr_rom_U :  component predict_ensemble_bXr_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


